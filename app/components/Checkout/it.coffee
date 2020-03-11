import React, {useEffect, useLayoutEffect, useState} from 'react'
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

OpenCast = 'checkout.open'
CloseCast = 'checkout.close'
export default (p) =>
  [shipping, setShipping] = useState {}
  [mode, setMode] = useState 'fillingForm'
  [paymentForm, setPaymentForm] = useState null

  onPaymentFailed = (error) =>
    ga 'send', 'event', {
      eventCategory: 'payment'
      eventAction: 'processing failed'
      eventLabel: error?.toString?()
    }
    setMode 'paymentFailed'
    cast 'checkout.paymentFailed'
    after 2000, => setMode 'fillingForm'

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
          if errors then return onPaymentFailed(errors?[0]?.message)
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
          .catch(onPaymentFailed)
          .then((response) =>
            if response.ok
              return response.text()
            else return response.text().then (errorInfo) =>
                Promise.reject errorInfo
          )
          .then((response) =>
            order = JSON.parse response
            setMode 'paymentSucceeded'
            cast 'checkout.paymentSucceeded', {
              id: order.result.payment.order_id,
              recipient: order.recipient
            }
            after 1500, => cast CloseCast
          )
          .catch(onPaymentFailed)
    })
    switch type
      when 'apple' then paymentForm.applePay = elementId: 'sq-apple-pay'
      when 'google' then paymentForm.googlePay = elementId: 'sq-google-pay'
    paymentForm.build()
    paymentForm

  useBus
    [OpenCast]: (amount) =>
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
    ShippingFields.every (field) => gshipping[field]?.trim().length > 0

  onClickPay = (event) =>
    event.preventDefault()
    if shippingIsValid()
      setMode 'processing'
      paymentForm.requestCardNonce()
    else
      setMode 'formError'
      after 1500, => setMode 'fillingForm'

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
            <button id="sq-creditcard" className="button-credit-card" onClick={onClickPay}>pay ${gtotal}</button>
         </div>
      </l.CheckoutRoot>

      <l.CheckoutStatus className={cx [mode]: yes}>
        <l.Icon>
          {switch mode
            when 'init' then '🧞‍♀️'
            when 'formError' then '💃🏽'
            when 'processing' then '❤️'
            when 'paymentSucceeded' then '🙏'
            when 'paymentFailed' then '☹️'
            when 'squareNotLoaded' then '☹️'
          }
        </l.Icon>
        <l.StatusText>
          {switch mode
            when 'init' then 'loading'
            when 'squareNotLoaded' then 'checkout failed. please reload.'
            when 'formError' then 'please fill out all fields'
            when 'processing' then 'sending payment'
            when 'paymentSucceeded' then 'yay, all set! thank you!'
            when 'paymentFailed'
              <>payment didn’t work.<br/>
                please verify your card details and try again.<br/>
                <l.details>
                  if you need help, email us at
                  <a href='mailto:whynot@expressyourmess.com'>
                    whynot@expressyourmess.com
                  </a>
                </l.details>
              </>
            else ''
          }
        </l.StatusText>
      </l.CheckoutStatus>
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
