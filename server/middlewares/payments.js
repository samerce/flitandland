const express = require('express');
const bodyParser = require('body-parser');
const crypto = require('crypto');
const squareConnect = require('square-connect');

const isProd = process.env.NODE_ENV === 'production'

module.exports = (app) => {
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({extended: false}));
  app.use(express.static(__dirname));

  const defaultClient = squareConnect.ApiClient.instance;

  const oauth2 = defaultClient.authentications['oauth2'];
  oauth2.accessToken = process.env.SQUARE_ACCESS_TOKEN

  defaultClient.basePath = isProd?
    'https://connect.squareup.com' : 'https://connect.squareupsandbox.com';

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
  } catch(error) {
    console.log('payment failed:\n' + error.response.text)
    res.status(500).json({
      title: 'Payment Failed',
      result: error.response.text,
    });
  }
}

async function createOrder(params, source) {
  const squareOrders = new squareConnect.OrdersApi()
  const locationId = "CWMV8TTJ1ZACA"; // test id - the white house!
  const body = new squareConnect.CreateOrderRequest()
  body.idempotency_key = createKey()
  body.order = new squareConnect.Order()
  body.order.location_id = locationId
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
    const response = await squareOrders.createOrder(locationId, body)
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
