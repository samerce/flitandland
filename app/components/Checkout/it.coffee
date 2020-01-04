import React, {useEffect, useState} from 'react'

import l from './styled'
import * as u from './util.coffee'
import {throttle} from 'lodash'

ShippingFields = [
  'name', 'address1', 'address2', 'city', 'state', 'postcode',
]
Mode = makeEnum [
  'teasing',
  'offering',
  'closing',
  'thanking',
]

gtotal = u.ShippingTotal
gshipping = {}
createOrder = (data, actions) => u.createOrder {total: gtotal, shipping: gshipping}, actions

export default (p) =>
  [shipping, setShipping] = useState {}
  [total, setTotal] = useState u.ShippingTotal
  [pickYourPrice, setPickYourPrice] = useState ''
  [pickedArt, setPickedArt] = useState {}
  [mode, setMode] = useState Mode.teasing

  useEffect (=>
    paypal.Buttons({
      style: {
        shape: 'pill'
      }
      createOrder,
      onApprove: (data, actions) =>
        u.onApprove data, actions
        setMode Mode.thanking
      onError: (error) =>
        u.onError error
        alert "\
          oH nO! :(\n\
          there was a problem processing your paypal payment.\n\
          you were not charged.\n\n\
          please try again!\
        "
    }).render '#paypalButtons'
  ), []

  onChangePrice = ({target}) =>
    # ga.sendEvent 'checkout', 'price changed'
    price = target.value.replace /[^0-9]*/g, ''
    newPrice =
      if price.length? then '$' + +price.toLocaleString([], {currency: 'USD'})
      else ''
    setPickYourPrice newPrice

    gtotal =
      if price then +price + u.ShippingTotal
      else u.ShippingTotal
    setTotal gtotal.toLocaleString([], {currency: 'USD'})

    if mode isnt Mode.closing
      setMode if price.length? then Mode.offering else Mode.teasing

  onChangeShipping = (key, value) =>
    # ga.sendEvent 'checkout', 'shipping entered'
    gshipping = {
      ...gshipping
      [key]: value
    }
    setShipping gshipping

  onClickGetIt = =>
    return if mode is Mode.closing or mode is Mode.thanking
    setMode Mode.closing
    # ga.sendEvent 'checkout', 'buy clicked'

  <l.PickArtForm>
    {# <SizeOptionsRoot>
      #{SizeOptions.map(this.renderSizeOption)}
    #</SizeOptionsRoot> */
    }

    <l.TotalRoot className={'checkout-' + mode}>
      <l.Itemization>
        <l.ItemName>
          {pickedArt.title}
        </l.ItemName>
        <l.PriceRoot>
          <l.PriceInput
            onChange={onChangePrice}
            placeholder={'pick your price!'}
            value={pickYourPrice}
          />
        </l.PriceRoot>
        <l.ShippingRoot>
          <l.ShippingPrice>${u.ShippingTotal}</l.ShippingPrice>
          <l.ShippingByline>shipping</l.ShippingByline>
          <l.PlusSign className='fa fa-plus' />
        </l.ShippingRoot>
      </l.Itemization>

      <l.CheckoutWidget onClick={onClickGetIt}>
        <l.TotalText>${total}</l.TotalText>
        <l.GetItText>
          {switch mode
            when Mode.offering then 'buy it now!'
            when Mode.closing then 'where do we ship it?'
            when Mode.thanking
              <div>
                ❤️ | thank you!<br/>
                💋 | {pickedArt.cheeky}<br/>
                💌 | check your email for details.<br/>
                🙏 | namaste, fellow creature.
              </div>
          }
        </l.GetItText>

        <l.CheckoutRoot>
          <l.Root id='paypalRoot'>
            <l.ShippingRoot className='inputs'>
              {ShippingFields.map (key) =>
                <l.ShippingInput
                  onChange={({target}) => onChangeShipping key, target.value}
                  value={shipping[key]}
                  placeholder={key}
                  key={key}
                />
              }
            </l.ShippingRoot>
            <div id='paypalButtons' />
          </l.Root>
        </l.CheckoutRoot>
      </l.CheckoutWidget>

    </l.TotalRoot>
  </l.PickArtForm>

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
