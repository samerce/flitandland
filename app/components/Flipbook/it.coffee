import React, {useLayoutEffect, useState, useEffect} from 'react'
import Countdown from '../Countdown/it.coffee'
import FaeButton from '../FaeButton/it.coffee'
import Checkout from '../Checkout/it.coffee'

import l from './styled'
import * as c from '../../constants'
import {cx} from '../../utils/style'

import { useSpring, animated } from 'react-spring'
import { useDrag } from 'react-use-gesture'
import useFlipbook from './useFlipbook.coffee'
import useToggle from '../../hooks/useToggle.coffee'
import useBus from '../../hooks/useBus.coffee'

import * as PagesMap from '../Bopz/Mangina.coffee'
Pages = Object.values(PagesMap)

FaeButtons = (p) =>
  [isTinkerbellTickled, setIsTinkerbellTickled] = useState no
  classes = cx {
    'flipbook-button': yes
    showSunrise: isTinkerbellTickled
  }
  onClickTinkerbell = =>
    if isTinkerbellTickled then p.play()
    else p.pause()
    setIsTinkerbellTickled not isTinkerbellTickled
  onClickSunrise = =>
    setIsTinkerbellTickled no
    p.next()

  <>
    <FaeButton className={classes + ' tinkerbell'}>
      <l.Tinkerbell onClick={onClickTinkerbell}>🧚🏽‍</l.Tinkerbell>
      <l.IntroText>hi! {"i'm"} jeli. i bend time</l.IntroText>
    </FaeButton>
    <FaeButton className={classes + ' sunrise'}>
      <l.Sunrise onClick={onClickSunrise}>🍊🍊🍊</l.Sunrise>
    </FaeButton>
    <FaeButton className={classes + ' yes'}>
      <l.Yes>🧞‍♀️‍</l.Yes>
    </FaeButton>
    <FaeButton className={classes + ' no'}>
      <l.No>🦠</l.No>
    </FaeButton>
  </>

SpringConfig = friction: 10, tension: 58, mass: 1
FaeSol = (p) =>
  [isOpen, toggleIsOpen] = useToggle no, 'sol.opened', 'sol.closed'
  [nailsAni, setNailsAni] = useState
    from: {opacity: 0, scale: .95}
    to: {opacity: 1, scale: 1}
    delay: 1000
  nailsStyle = useSpring {...nailsAni}

  [rootAni, setRootAni] = useState {}
  rootStyle = useSpring {...rootAni}

  <FaeButton className='flipbook-button nails'>
    <animated.div style={{...rootStyle, zIndex: 1}}>
      <l.Nails onClick={toggleIsOpen} style={{
          ...nailsStyle, transform: "scale(#{nailsStyle.scale})"
        }}>
        <img src={c.SRC_URL + 'commons/solwhite.png'} />
      </l.Nails>
    </animated.div>
  </FaeButton>

YesSheet = (p) =>
  [visible, setVisible] = useState no
  [checkoutIsOpen, toggleCheckout, setCheckoutIsOpen
  ] = useToggle no, 'checkout.opened', 'checkout.closed'
  useBus
    'sol.opened': => setVisible yes
    'sol.closed': => setVisible no
    'checkout.close': => setCheckoutIsOpen no
    'checkout.open': => setCheckoutIsOpen yes
  <l.YesRoot className={cx {visible}}>
    <l.Juice>{p.juice}</l.Juice>
    <l.LeftActions className='left'>
      <l.No>😶</l.No>
      <l.Yes delay={100}>🤩</l.Yes>
    </l.LeftActions>
    <l.RightActions className='right'>
      <l.CheckoutRoot className={cx show: checkoutIsOpen}>
        <Checkout />
      </l.CheckoutRoot>
      <l.Buy onClick={toggleCheckout} delay={100}>
        <img src={c.SRC_URL + 'commons/buy.png'} />
      </l.Buy>
      <l.Chat onClick={=> cast 'chat.toggle'}>
        <img src={c.SRC_URL + 'commons/letschat.png'} />
      </l.Chat>
    </l.RightActions>
  </l.YesRoot>

useBusToggle = (yesCast, noCast, init) =>
  [thing, setit] = useState init
  useBus
    [yesCast]: => setit yes
    [noCast]: => setit no
  [thing, setit]

downTime = null
export default Flipbook = =>
  [activePage, activeIndex, isLoaded, actions] = useFlipbook Pages
  [checkoutIsOpen] = useBusToggle 'checkout.opened', 'checkout.closed'

  withDrag = useDrag ({down, first, elapsedTime, movement: [mx, my]}) =>
    return unless isLoaded
    if first
      actions.pause()
      downTime = Date.now()
    if not down
      if (Date.now() - downTime) < 500 then actions.advance()
      else actions.play()

  <l.Root>
    <Countdown duration={activePage.duration - 100} />
    {Pages.map (Page, i) =>
      mode = cx {
        hide: i < activeIndex
        show: i is activeIndex
        preload: i > activeIndex
        blur: checkoutIsOpen
      }
      <l.PageRoot className={mode} {...withDrag()}>
        <Page mode={mode} actions={actions} isLoaded={isLoaded} />
      </l.PageRoot>
    }
    <FaeSol />
    <YesSheet />
  </l.Root>
