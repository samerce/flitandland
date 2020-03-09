import React, {useState, useLayoutEffect, useMemo} from 'react'
import Sheet from '../Sheet/it.coffee'

import l from './styled'
import {cx} from '../../utils/style'
import * as c from '../../constants'

import useScreenSize from '../../hooks/useScreenSize.coffee'
import useBus from '../../hooks/useBus.coffee'

Tabs = (p) =>
  [activeTab, setActiveTab] = useState 0
  setTab = (index) =>
    setActiveTab index
    p.onChange index

  <l.TabsRoot>
    {p.tabs.map (text, index) =>
      <l.Tab
        numTabs={p.tabs.length}
        className={cx active: activeTab is index}
        onClick={=> setTab index}>
        {text}
      </l.Tab>
    }
  </l.TabsRoot>

ThinkingDuration = 1500
AcceptDuration = ThinkingDuration + 1500
PickYourPrice = =>
  [mode, setMode] = useState 'idle'
  [price, setPrice] = useState null
  makeOffer = =>
    setMode 'thinking'
    priceAsNum = +(price.replace '$', '')
    if price >= 10.81
      after ThinkingDuration, => setMode 'acceptOffer'
      after AcceptDuration, =>
        setMode 'awaitPayment'
        cast 'pay.open', +(price.replace '$', '')
    else
      after ThinkingDuration, => setMode 'rejectOffer'
      after AcceptDuration, =>
        setMode 'priceEntered'
        cast 'contactus.open', => <div>i want my book in your hands</div>

  onChangePrice = ({target}) =>
    # ga.sendEvent 'checkout', 'price changed'
    console.log 'raw price', target.value
    newPrice = target.value.replace /[^0-9]*/g, ''
    console.log 'grep', newPrice.length
    isJustDollarSign = newPrice.length is 1 and newPrice[0] is '$'
    newPrice =
      if newPrice.length > 0 and not isJustDollarSign
        '$' + +newPrice.toLocaleString([], {currency: 'USD'})
      else null
    setPrice newPrice
    console.log newPrice
    if newPrice then setMode 'priceEntered'
    else setMode 'idle'

  <l.PickYourPrice className={cx [mode]: yes}>
    <l.PriceInput value={price} onChange={onChangePrice} placeholder='pick your price' />
    <l.Line className={cx show: mode isnt 'idle'} />
    <l.Buy onClick={makeOffer}>
      {switch mode
        when 'priceEntered' then 'make offer'
        when 'thinking' then 'considering it...'
        when 'acceptOffer' then 'you got a deal!'
        when 'rejectOffer' then 'let’s talk!'
        when 'awaitPayment' then 'sealing the deal'
        else ''
      }
    </l.Buy>
  </l.PickYourPrice>

BookTabs = ['front', 'back', 'irl']
BookImages = [
  'dqitwh cover mq.jpg', 'drag pixel book launch.jpg'
]
BookFormats = ['paperback', 'ebook']
GetIt = =>
  [formatIndex, setFormatIndex] = useState 0
  <l.GetIt>
    <Tabs tabs={BookFormats} onChange={setFormatIndex} />
    {[
      <l.AboutFormat>
        this cost $10.81 to print and ship
      </l.AboutFormat>,
      <l.AboutFormat>
        this cost only electrons to deliver
      </l.AboutFormat>
    ][formatIndex]}
    <l.GetItButtons>
      <PickYourPrice />
      <l.Or>or</l.Or>
      <l.BarterBaby onClick={=> cast 'contactus.open'}>
        barter, baby
      </l.BarterBaby>
    </l.GetItButtons>
  </l.GetIt>

BookPics = =>
  [imageIndex, setImageIndex] = useState 0
  <l.PicRoot>
    <Tabs tabs={BookTabs} onChange={setImageIndex} />
    <l.Image>
      <img src={c.SRC_URL + 'commons/' + BookImages[imageIndex]} />
    </l.Image>
  </l.PicRoot>

export default BookCheckout = (p) =>
  [open, setOpen] = useState no
  useLayoutEffect (=>
    after 500, => setOpen yes
  ), []
  useBus
    'book.checkout': => setOpen yes
  <Sheet open={open}>
    <BookPics />
    <l.About>
      imagine waking mañana and a drag queen is president.<br/>
      what would america look like with wild injections of colorful yes?<br/>
      emancipated lands of yes, and await you<br/>
      —whole celestial realms outside the absurd world of no.<br/>
      <br/><br/>
      drag queen in the white house is a reimagining. a game.<br/>
      a queer piece of living theatre about what happens when we set fear down.<br/>
      <br/><br/>
      there are 500,000 offices up for election, pick one.<br/>
      i’ll go first.<br/>
      i’m 35 today, i think i’ll run for president.<br/>
    </l.About>
    <GetIt />
  </Sheet>