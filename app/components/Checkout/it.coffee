import React, {useEffect, useState} from 'react'

import l from './styled'
import * as u from './util.coffee'

ShippingFields = [
  'name', 'address1', 'address2', 'city', 'state', 'postcode',
]

ShippingInput = (p) =>
  onChangeInput = ({target}) =>
    # ga 'send', 'event', {
    #   eventCategory: 'checkout'
    #   eventAction: 'shipping info entered'
    # }
    p.setShipping {
      ...p.shipping
      [p.id]: target.value
    }
  <l.ShippingInput
    onChange={onChangeInput}
    value={p.shipping[p.id]}
    placeholder={p.id}
    key={p.id}
  />

export default (p) =>
  [shipping, setShipping] = useState {}

  useEffect =>
    window.paypal.Buttons({
      style: {
        shape: 'pill'
      }
      createOrder: (data, actions) => u.createOrder p.order, shipping, actions
      onApprove: u.onApprove
      onError: u.onError
    }).render '#paypalButtons'

  <l.Root>
    <l.ShippingRoot>
      {ShippingFields.map (id) =>
        <ShippingInput id={id} shipping={shipping} setShipping={setShipping} />
      }
    </l.ShippingRoot>

    <l.PayPalButtons id='paypalButtons' />
  </l.Root>

# order: {
#   total: int,
#   subtotal: int,
#   tax: int, [optional]
#   description: string, [optional]
#   items: [
#     {
#       name: string,
#       description: string,
#       price: int,
#       tax: int,
#       quantity: int,
#       sku: string,
#     }
#   ],
#   shipping: {
#     total: int, [optional]
#     name: string,
#     address1: string,
#     address2: string,
#     city: string,
#     state: string,
#     postcode: string,
#     country: string, [optional]
#   }
# }
