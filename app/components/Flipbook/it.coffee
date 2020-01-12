import React, {useLayoutEffect, useState, useEffect} from 'react'
import Countdown from '../Countdown/it.coffee'
import FaeButton from '../FaeButton/it.coffee'

import l from './styled'
import * as c from '../../constants'
import {cx} from '../../utils/style'

import useFlipbook from './useFlipbook.coffee'
import { useSpring, animated } from 'react-spring'
import { useDrag } from 'react-use-gesture'

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
  [nailsAni, setNailsAni] = useState
    from: {opacity: 0, scale: .95}
    to: {opacity: 1, scale: 1}
    delay: 1000
  nailsStyle = useSpring {...nailsAni}

  [rootAni, setRootAni] = useState {}
  rootStyle = useSpring {...rootAni}

  <FaeButton className='flipbook-button nails'>
    <animated.div style={{...rootStyle, zIndex: 1}}>
      <l.Nails onClick={p.onClick} style={{
          ...nailsStyle, transform: nailsStyle.scale.interpolate (s) => "scale(#{s})"
        }}
        onMouseEnter={=> setNailsAni to: scale: 1.1}
        onMouseLeave={=> setNailsAni to: scale: 1}
        onMouseDown={=> setNailsAni to: scale: .95}
        onMouseUp={=> setNailsAni to: scale: 1.1}
      >
        <img src={c.SRC_URL + 'commons/solwhite.png'} />
      </l.Nails>
    </animated.div>
  </FaeButton>

swipeLeft = no
export default Flipbook = =>
  [activePage, activeIndex, isLoaded, actions] = useFlipbook Pages
  {togglePlayPause, advance} = actions
  withDrag = useDrag ({down, movement: [mx, my]}) =>
    if down
      swipeLeft = mx < -100 or my < -100
    else
      if swipeLeft then advance()
      else togglePlayPause()

  <l.Root {...withDrag()} style={{
    pointerEvents: if isLoaded then 'all' else 'none'
  }}>
    <Countdown duration={activePage.duration - 100} />
    {Pages.map (Page, i) =>
      mode = cx {
        hide: i < activeIndex
        show: i is activeIndex
        preload: i > activeIndex
      }
      <l.PageRoot className={mode}>
        <Page mode={mode} actions={actions} isLoaded={isLoaded} />
      </l.PageRoot>
    }
    <FaeSol />
  </l.Root>
