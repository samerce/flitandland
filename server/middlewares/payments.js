const express = require('express');
const bodyParser = require('body-parser');
const crypto = require('crypto');
const squareConnect = require('square-connect');
const {SquareLocationId} = require('../square')
const {sendMail} = require('../mailer')
const orderEmail = require('../orderEmail')

module.exports = (app) => {
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({extended: false}));
  app.use(express.static(__dirname));
  app.post('/process-payment', processPayment)
}

async function processPayment(req, res) {
  const params = req.body;
  params.amount *= 100
  const squarePayments = new squareConnect.PaymentsApi();
  console.log('purchase params: ', params)
  const paymentReq = new squareConnect.CreatePaymentRequest()
  paymentReq.idempotency_key = createKey()
  paymentReq.source_id = params.nonce
  paymentReq.amount_money = new squareConnect.Money()
  paymentReq.amount_money.amount = params.amount
  paymentReq.amount_money.currency = 'USD'
  console.log('paymentreq: ', paymentReq)
  try {
    const order = await createOrder(params, req.hostname)
    paymentReq.order_id = order.id
    const response = await squarePayments.createPayment(paymentReq);
    console.info('payment done!')
    res.status(200).json({
      title: 'Payment Successful',
      result: response,
      recipient: params.recipient,
    });
    slackUs(response.payment)
    emailCustomer(params.recipient, response.payment)
  } catch(error) {
    console.log('payment failed:\n' + error)
    res.status(500).json({
      title: 'Payment Failed',
      result: error,
    });
  }
}

async function createOrder(params, source) {
  const squareOrders = new squareConnect.OrdersApi()
  const body = new squareConnect.CreateOrderRequest()
  body.idempotency_key = createKey()
  body.order = new squareConnect.Order()
  body.order.location_id = SquareLocationId
  body.order.line_items = params.items.map(item => {
    lineItem = new squareConnect.OrderLineItem()
    lineItem.quantity = item.quantity
    lineItem.catalog_object_id = item.catalog_object_id
    lineItem.base_price_money = new squareConnect.Money()
    lineItem.base_price_money.amount = params.amount
    lineItem.base_price_money.currency = 'USD'
    return lineItem
  })

  const recipient = params.recipient
  const fulfillment = new squareConnect.OrderFulfillment()
  const shipment = new squareConnect.OrderFulfillmentShipmentDetails()
  shipment.recipient = new squareConnect.OrderFulfillmentRecipient()
  shipment.recipient.display_name = recipient.display_name
  shipment.recipient.email_address = recipient.email_address

  const address = new squareConnect.Address()
  Object.assign(address, recipient.address)
  shipment.recipient.address = address

  fulfillment.shipment_details = shipment
  fulfillment.type = 'SHIPMENT'
  body.order.fulfillments = [fulfillment]

  try {
    const response = await squareOrders.createOrder(SquareLocationId, body)
    console.info('order created\n')
    return response.order
  } catch (error) {
    console.error('order creation failed:\n' + error.response.text);
    throw error
  }
}

function createKey() {
  // length of idempotency_key should be less than 45
  return crypto.randomBytes(22).toString('hex')
}

function slackUs(payment) {
  fetch(process.env.SLACK_WEBHOOK_URL, {
    method: 'POST',
    headers: {
      Accept: 'application/json'
    },
    body: JSON.stringify({
      text: '🙌 new order! 🙌\n' + getOrderUrl(payment.order_id),
      channel: '#orders',
    }),
  }).then((response) => {
    if (response.ok) console.info('slack notification succeeded!')
    else console.error('slack notification failed\n', response.status)
  })
}

function emailCustomer(recipient, payment) {
  sendMail({
    to: payment.buyer_email_address,
    subject: 'thanks for your order!',
    html: orderEmail({
      orderId: payment.order_id,
      total: payment.total_money.amount / 100,
      receiptUrl: payment.receipt_url,
      recipient: recipient,
    })
  })
}

function getOrderUrl(orderId) {
  return `https://squareup.com/dashboard/orders/overview/${orderId}`
}
