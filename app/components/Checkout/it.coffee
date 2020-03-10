import React, {useEffect, useState} from 'react'
import Sheet from '../Sheet/it.coffee'

import l from './styled'
import * as u from './util.coffee'
import * as c from '../../constants'
import {cx} from '../../utils/style'
import {throttle} from 'lodash'

import useBus from '../../hooks/useBus.coffee'

ShippingFields = [
  'name', 'email', 'address', 'city', 'state', 'postcode',
]
Mode = makeEnum [
  'teasing',
  'offering',
  'closing',
  'thanking',
]

gtotal = u.ShippingTotal
gshipping = {}

makeOrder = (total, shipping) =>
  amount: total
  items: [
    {
      name: 'drag queen in the white house'
      quantity: '1'
      total_money: total
      catalog_object_id: 'TXEFRKQOVIOTZ3L2G4DKQ7FC'
    }
  ]
  recipient:
    display_name: shipping.name
    email_address: shipping.email
    address:
      address_line_1: shipping.address
      locality: shipping.city
      administrative_district_level_1: shipping.state
      postal_code: shipping.postcode
      first_name: shipping.name
      country: 'US'

OpenCast = 'pay.open'
CloseCast = 'pay.close'
export default (p) =>
  [shipping, setShipping] = useState {}
  [total, setTotal] = useState u.ShippingTotal
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
                ...makeOrder(gtotal, gshipping)
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
              cast CloseCast
              # show a payment confirmation
              # after 1500, => cast 'pay.close'
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

  useBus
    [OpenCast]: (amount) =>
      setTotal amount
      gtotal = amount
      setPaymentForm makePaymentForm 'card'
    [CloseCast]: =>

  onChangeShipping = (key, value) =>
    # ga.sendEvent 'checkout', 'shipping entered'
    gshipping = {
      ...gshipping
      [key]: value
    }
    setShipping {...gshipping}

  shippingIsValid = =>
    valid = no
    valid = valid and value?.trim().length > 0 for key, value of gshipping
    valid

  onClickPay = (event) =>
    event.preventDefault()
    if not shippingIsValid()
      return alert 'please enter all shipping details'
    paymentForm.requestCardNonce()

  <Sheet openCast={OpenCast} closeCast={CloseCast}
    className={cx [mode]: yes}
    style={{flexWrap: 'wrap', alignItems: 'center'}}>
    <l.CheckoutWidget>
      <l.Title>get your book</l.Title>

      <l.CheckoutRoot>
          <l.ShippingRoot className='inputs'>
            {ShippingFields.map (key, index) =>
              <l.ShippingInput
                type='text'
                className={ShippingFields[index]}
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
      </l.CheckoutRoot>
    </l.CheckoutWidget>
  </Sheet>

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
