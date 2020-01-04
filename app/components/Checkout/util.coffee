export ShippingTotal = 5

getPrice = (intPrice) => {
    value: intPrice.toString()
    currency_code: 'USD'
}

export makePaypalOrder = (order, shipping) => {
  intent: 'CAPTURE',
  application_context: {
    brand_name: 'express your mess',
    user_action: 'PAY_NOW',
  },
  purchase_units: [{
    amount: {
      ...getPrice(order.total),
      breakdown: {
        item_total: getPrice(order.subtotal),
        tax_total: getPrice(order.tax || 0),
        shipping: getPrice(order.shippingTotal || 0),
      },
    },
    payee: {
      email_address: 'rise@purplerepublic.us',
    },
    description: order.description, # max 127 chars
    items: order.items.map (item) => {
      ...item,
      category: 'PHYSICAL_GOODS',
      unit_amount: getPrice(item.price),
      tax: getPrice(item.tax || 0),
    },
    shipping: {
      name: {
        full_name: shipping.name,
      },
      address: {
        address_line_1: shipping.address1,
        address_line_2: shipping.address2,
        admin_area_2: shipping.city,
        admin_area_1: shipping.state,
        postal_code: shipping.postcode,
        country_code: shipping.country || 'US',
      },
    },
    note_to_payer: 'thanks for supporting the love revolution!',
    custom_id: Date.now(),
    soft_descriptor: order.ccStatementText || 'artloverevolution',
    #invoice_id: '12345',
  }],
}

export makeOrder = (details) =>
  itemPrice = details.total - ShippingTotal
  {
    total: details.total,
    subtotal: itemPrice,
    shippingTotal: ShippingTotal,
    description: 'pick your price faerie offering!',
    items: [
      {
        name: details.name + ' — 11 x 14 metallic print',
        description: 'a gorgeous, shiny new print of original artwork',
        price: itemPrice,
        quantity: 1,
        sku: details.id,
      },
    ],
  }

export createOrder = (order, actions) =>
  # ga 'send', 'event', {
  #   eventCategory: 'checkout',
  #   eventAction: 'paypal button clicked',
  # }
  console.log 'shipping', order.shipping
  paypalOrder = makePaypalOrder makeOrder(order), order.shipping
  console.log paypalOrder
  actions.order.create paypalOrder

export onApprove = (data, actions) =>
  actions.order.capture().then (detail) =>
    window.dispatchEvent new CustomEvent('OrderPlaced', {detail})
    window.dispatchEvent new CustomEvent('PostToSlack', detail: {
      channel: 'orders'
      msg: JSON.stringify(details, null, 2) +
        '\n🎉——————————————🤩———————————————🎉'
    })

export onError = (error) =>
  window.dispatchEvent new CustomEvent('OrderFailed', detail: error)
  window.dispatchEvent new CustomEvent('PostToSlack', detail: {
    channel: 'orders'
    msg: '🥀🥀🥀 order failed!\n' + JSON.stringify(error, null, 2) + '\n🥀🥀🥀'
  })
  # ga 'send', 'event', {
  #   eventCategory: 'checkout',
  #   eventAction: 'payment error: ' + error,
  # }
