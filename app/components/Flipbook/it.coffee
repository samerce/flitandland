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

SwipePage = (p) =>
  # [{ x, y }, setit] = useSpring => x: 0, y: 0
  # withDrag = useDrag ({ first, down, movement: [mx, my] }) =>
  #   if down
  #     setit {x: mx, y: my}
  #   else if mx < -100 or my < -100
  #     p.onTickled()
  #   else if Math.abs(mx) < 10 or Math.abs(my) < 10
  #     p.onTouched()

  <animated.div className='swipe-page'>
    {p.children}
  </animated.div>

export default Flipbook = =>
  [activePage, activeIndex, isLoaded, actions] = useFlipbook Pages
  {togglePlayPause, advance} = actions

  <l.Root onClick={=> dispatch 'fal.bgWasClicked'}>
    <Countdown duration={activePage.duration - 100} />
    <FaeSol onClick={actions.toggleChat} />
    {Pages.map (Page, i) =>
      mode = cx {
        hide: i < activeIndex
        show: i is activeIndex
        preload: i > activeIndex
      }
      <l.PageRoot className={mode}>
        <Page mode={mode} actions={actions} />
      </l.PageRoot>
    }
  </l.Root>
