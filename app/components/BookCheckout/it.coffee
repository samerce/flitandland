import React, {useState, useLayoutEffect, useMemo} from 'react'
import Sheet from '../Sheet/it.coffee'

import l from './styled'
import {cx} from '../../utils/style'
import * as c from '../../constants'

import useScreenSize from '../../hooks/useScreenSize.coffee'
import useBus from '../../hooks/useBus.coffee'
import {openInNewTab} from '../../utils/nav'

Tabs = (p) =>
  [activeTab, setActiveTab] = useState 0
  setTab = (index) =>
    setActiveTab index
    p.onChange index

  <l.TabsRoot {...p}>
    {p.tabs.map (text, index) =>
      <l.Tab
        numTabs={p.tabs.length}
        className={cx active: activeTab is index}
        onClick={=> setTab index}>
        {text}
      </l.Tab>
    }
  </l.TabsRoot>

BookCost = 8.50
ThinkingDuration = 1000
AcceptDuration = ThinkingDuration + 1000
PickYourPrice = =>
  [mode, setMode] = useState 'idle'
  [price, setPrice] = useState ''

  makeOffer = =>
    ga 'send', 'event', {
      eventCategory: 'book checkout'
      eventAction: 'make offer button clicked'
    }
    PriceFormat = /^\$(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/g
    if not PriceFormat.test price
      return alert 'please enter a real price'

    setMode 'thinking'
    priceAsNum = +(price.replace '$', '')
    if priceAsNum >= BookCost
      after ThinkingDuration, => setMode 'acceptOffer'
      after AcceptDuration, =>
        setMode 'awaitPayment'
        cast 'checkout.open', +(price.replace '$', '')
    else
      after ThinkingDuration, => setMode 'rejectOffer'
      after AcceptDuration, =>
        setMode 'priceEntered'
        cast 'contactus.open'

  onChangePrice = ({target}) =>
    # ga.sendEvent 'checkout', 'price changed'
    newPrice = target.value?.replace '$', ''
    isJustDollarSign = newPrice.length is 1 and newPrice[0] is '$'
    newPrice =
      if newPrice?.length > 0 and not isJustDollarSign
        '$' + newPrice.toLocaleString('en-US', {
          style: 'currency'
          currency: 'USD'
          maximumSignificantDigits: 2
        })
      else ''
    setPrice newPrice
    if newPrice?.length > 1 then setMode 'priceEntered'
    else setMode 'idle'

  useBus
    'checkout.paymentFailed': => setMode 'priceEntered'
    'checkout.close': => setMode 'priceEntered'
    'book.checkoutClose': =>
      setPrice ''
      setMode 'idle'

  <l.PickYourPrice className={cx [mode]: yes}>
    <l.PriceInput value={price} onChange={onChangePrice} placeholder='pick your price' />
    <l.Line className={cx show: mode isnt 'idle'} />
    <l.Buy onClick={makeOffer}>
      {switch mode
        when 'priceEntered' then '🚀'
        when 'thinking' then 'considering it...'
        when 'acceptOffer' then 'you got a deal!'
        when 'rejectOffer' then 'let’s talk!'
        when 'awaitPayment' then 'sealing the deal'
        when 'thanking' then 'thank you!'
        else ''
      }
    </l.Buy>
  </l.PickYourPrice>

GetItButtons = =>
  onClickBarter = =>
    cast 'contactus.open'
    ga 'send', 'event', {
      eventCategory: 'book checkout'
      eventAction: 'barter button clicked'
    }
  onClickAmazon = =>
    openInNewTab c.BookUrl
    ga 'send', 'event', {
      eventCategory: 'book checkout'
      eventAction: 'amazon button clicked'
    }
  <l.GetItButtons>
    <PickYourPrice />
    <l.Or>or</l.Or>
    <l.BarterBaby onClick={onClickBarter}>
      barter, baby
    </l.BarterBaby>
    <l.Or>or</l.Or>
    <l.BarterBaby onClick={onClickAmazon}>
      amazon
    </l.BarterBaby>
  </l.GetItButtons>

OrderConfirmation = ({order}) =>
  {display_name = '', email_address = '', address = {}} = order.recipient
  <l.OrderConfirmation>
    <l.ThanksText>thank you!</l.ThanksText>
    <l.DoneText>your book is ordered</l.DoneText>
    <l.Order><span>{'order '}</span>{order.id}</l.Order>
    <l.Address key='email'>{email_address}</l.Address>
    <l.Address key='name'>{display_name}</l.Address>
    <l.Address key='address1'>{address.address_line_1}</l.Address>
    <l.Address key='address2'>
      {address.locality}, {address.administrative_district_level_1}  {address.postal_code}
    </l.Address>
  </l.OrderConfirmation>

BookTabs = ['front', 'back', 'author']
BookImages = [
  'dqitwh cover mq.jpg', 'dqitwh back mq.jpg', 'drag pixel book launch.jpg'
]
BookFormats = ['paperback', 'ebook']
GetIt = =>
  [formatIndex, setFormatIndex] = useState 0
  <l.GetIt>
    <Tabs tabs={BookFormats} onChange={setFormatIndex} className='tabs' />
    <l.CuteInfo>
      <span><br/>↯</span>
      printing+shipping costs $10 on our end
    </l.CuteInfo>
    <GetItButtons />
  </l.GetIt>

BookPics = =>
  [imageIndex, setImageIndex] = useState 0
  <l.PicRoot>
    <l.Image>
      <img src={c.SRC_URL + 'commons/' + BookImages[imageIndex]} />
    </l.Image>
    <Tabs tabs={BookTabs} onChange={setImageIndex} />
  </l.PicRoot>

export default BookCheckout = (p) =>
  [order, setOrder] = useState()
  useBus
    'checkout.paymentSucceeded': (order) => setOrder order
    'book.closeCheckout': => setOrder null

  <Sheet openCast='book.openCheckout' closeCast='book.closeCheckout'
    className='bookCheckoutSheet'>
    <l.GlobalStyle />
    <BookPics />
    <l.Details>
      <l.About>
        <l.title>drag queen in the white house</l.title>
        imagine waking mañana and a drag queen is president.<br/>
        what would america look like with wild injections of colorful yes?<br/><br/>
        emancipated lands of yes, and await you<br/>
        —whole celestial realms outside the absurd world of no.
        <br/><br/>
        drag queen in the white house is a reimagining. a game.<br/>
        a queer piece of living theatre about what happens when we set fear down.
        <br/><br/>
        there are 500,000 offices up for election, pick one.<br/>
        i’ll go first.<br/>
        i’m 35 today, i think i’ll run for president.<br/>
      </l.About>
      {
        if order then <OrderConfirmation order={order} />
        else <GetIt />
      }
    </l.Details>
  </Sheet>
