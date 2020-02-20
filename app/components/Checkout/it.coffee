import React, {useEffect, useState} from 'react'

import l from './styled'
import * as u from './util.coffee'
import {throttle} from 'lodash'

ShippingFields = [
  'name', 'email', 'address1', 'address2', 'city', 'state', 'postcode',
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

makeOrder = () =>
  amount: gtotal
  items: [
    {
      name: 'drag queen in the white house'
      quantity: '1'
      total_money: gtotal
      catalog_object_id: 'TXEFRKQOVIOTZ3L2G4DKQ7FC'
    }
  ]
  recipient:
    display_name: gshipping.name
    email_address: gshipping.email
    address:
      address_line_1: gshipping.address1
      address_line_2: gshipping.address2
      locality: gshipping.city
      administrative_district_level_1: gshipping.state
      postal_code: gshipping.postcode
      first_name: gshipping.name
      country: 'US'

export default (p) =>
  [shipping, setShipping] = useState {}
  [total, setTotal] = useState u.ShippingTotal
  [pickYourPrice, setPickYourPrice] = useState ''
  [pickedArt, setPickedArt] = useState {}
  [mode, setMode] = useState Mode.teasing
  [paymentForm, setPaymentForm] = useState null

  makePaymentForm = (type) =>
    paymentForm = new SqPaymentForm({
      locationId: 'TPWBYE84W506V' # test value - the white house!
      applicationId:
        if process.env.NODE_ENV is 'production'
           'sq0idp-9ggRDaOxIOjCFSAnUmiOew'
        else 'sandbox-sq0idb-nhDCt22ZX39bg3y7zcC7ug'
      autoBuild: false
      inputClass: 'sq-input'
      card:
        elementId: 'sq-card'
      callbacks:
        # methodsSupported: (methods, unsupportedReason) =>
        #   console.log 'supported methods: ' + methods
        #   applePayBtn = document.getElementById 'sq-apple-pay'
        #   applePayBtn.style.display = 'inline-block' if methods.applePay?
        #   googlePayBtn = document.getElementById 'sq-google-pay'
        #   googlePayBtn.style.display = 'inline-block' if methods.googlePay?
        cardNonceResponseReceived: (errors, nonce, cardData) =>
          if errors
            console.error 'error initiating payment:'
            console.error '\n' + error.message for error in errors
          else
            console.log "The generated nonce is:\n#{nonce}"
            fetch('process-payment', {
              method: 'POST'
              headers:
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              body: JSON.stringify({
                nonce,
                ...makeOrder(gtotal, shipping)
              })
            })
            .catch((err) =>
              console.log 'square: network error: ' + err
            )
            .then((response) =>
              if response.ok
                return response.text()
              else return response.text().then (errorInfo) =>
                  Promise.reject errorInfo
            )
            .then((data) =>
              console.log JSON.stringify(data)
              console.log 'payment done!'
            )
            .catch((err) =>
              console.error 'square payment failed\n' + err.toString()
            )
    })
    switch type
      when 'apple' then paymentForm.applePay = elementId: 'sq-apple-pay'
      when 'google' then paymentForm.googlePay = elementId: 'sq-google-pay'
    paymentForm.build()
    paymentForm

  # useEffect (=>
  #   return unless window.paypal
  #   window.paypal.Buttons({
  #     style: {
  #       shape: 'pill'
  #     }
  #     createOrder,
  #     onApprove: (data, actions) =>
  #       u.onApprove data, actions
  #       setMode Mode.thanking
  #     onError: (error) =>
  #       u.onError error
  #       alert "\
  #         oH nO! :(\n\
  #         there was a problem processing your paypal payment.\n\
  #         you were not charged.\n\n\
  #         please try again!\
  #       "
  #   }).render '#paypalButtons'
  # ), [window.paypal]

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
    setShipping {...gshipping}

  onClickGetIt = =>
    return if mode is Mode.closing or mode is Mode.thanking
    setMode Mode.closing
    setPaymentForm makePaymentForm 'card'
    # ga.sendEvent 'checkout', 'buy clicked'

  onClickPay = (event) =>
    event.preventDefault()
    paymentForm.requestCardNonce()

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
                  type='text'
                  onChange={({target}) => onChangeShipping key, target.value}
                  value={shipping[key]}
                  placeholder={key}
                  key={key}
                />
              }
            </l.ShippingRoot>
            <div id="form-container">
              <div id="sq-card"></div>
              <button id="sq-creditcard" className="button-credit-card" onClick={onClickPay}>pay ${total}</button>
           </div>
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
