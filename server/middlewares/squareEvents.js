const crypto = require('crypto')
const fetch = require('node-fetch')
const SquareConnect = require('square-connect')
const {SquareLocationId} = require('../square')

const getOrderUrl = (orderId) => `https://squareup.com/dashboard/orders/overview/${orderId}`

module.exports = (app) => {
  app.post('/square-hook', handleSquareEvent)
}

async function handleSquareEvent(req, res) {
  if (!signatureIsValid(req)) {
    return res.status(400).send('square signature mismatch')
  }
  if (req.body['event_type'] !== 'PAYMENT_UPDATED') {
    return res.status(200).send('square update not needed')
  }

  const paymentId = req.body['entity_id']
  const payment = await getPayment(paymentId)

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

  res.status(200).send('square update handled successfully')
}

function signatureIsValid(req) {
  const dataToHash = `https://${req.hostname}/square-hook${JSON.stringify(req.body)}`
  const hmac = crypto.createHmac('sha1', process.env.SQUARE_WEBHOOK_SIG_KEY)
  hmac.update(dataToHash)

  return hmac.digest('base64') === req.headers['x-square-signature']
}

function getPayment(paymentId) {
  const Payments = new SquareConnect.PaymentsApi()
  return Payments.getPayment(paymentId)
  .then((data) => {
    console.info('fetched square payment:\n' + JSON.stringify(data))
    return data.payment
  }, (error) => {
    console.error('failed to fetch square payment\n' + error)
  })
}

function getOrder(orderId) {
  var Orders = new SquareConnect.OrdersApi()
  var body = new SquareConnect.BatchRetrieveOrdersRequest()
  body.order_ids = [orderId]

  return Orders.batchRetrieveOrders(SquareLocationId, body)
  .then((data) => {
    console.info('fetched square order:\n' + data)
    const {orders} = data
    return orders.length? orders[0] : null
  }, (error) => {
    console.error('failed to fetch square order\n', error)
  })
}
