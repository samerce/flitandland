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
    intro: p.isIntro
    disabled: p.isIntro
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
  [anim, setAnim] = useState
    from: {opacity: 0, scale: .95}
    to: {opacity: 1, scale: 1}
    delay: 1000
  style = useSpring {...anim}
  classes = cx {
    'flipbook-button': yes
    intro: p.isIntro
    disabled: p.isIntro
  }
  <FaeButton className={classes + ' nails'}>
    <animated.div style={{
      ...style,
      pointerEvents: 'all'
      zIndex: 1
      transform: style.scale.interpolate((s) => "scale(#{s})")
    }}>
      <l.Nails onClick={p.onClick}
        onMouseEnter={=> setAnim to: {scale: 1.1}}
        onMouseLeave={=> setAnim to: {scale: 1}}
        onMouseDown={=> setAnim to: {scale: .95}}
        onMouseUp={=> setAnim to: {scale: 1.1}}
      >
        <img src={c.SRC_URL + 'commons/solwhite.png'} />
      </l.Nails>
    </animated.div>
    <l.IntroText>
      if 100 million of us put four quarters in our pocket every single day and gave them out to the first four people that wanted them, then $100 million dollars a day would circulate into the hands of those who need a break. that’s 365 billion dollars a year, one quarter at a time.<br/><br/>
      power will tell you it’s hopeless. that the problems are too great to contemplate. that this is as good as it gets. it’s the lie of our lifetime.
    </l.IntroText>
  </FaeButton>

SwipePage = (p) =>
  [{ x, y }, setit] = useSpring => x: 0, y: 0
  withDrag = useDrag ({ first, down, movement: [mx, my] }) =>
    if down
      setit {x: mx, y: my}
    else if mx < -100 or my < -100
      p.onTickled()
    else if Math.abs(mx) < 10 or Math.abs(my) < 10
      p.onTouched()

  <animated.div {...withDrag()} style={{x,y}} className='swipe-page'>
    {p.children}
  </animated.div>

export default Flipbook = =>
  [activePage, activeIndex, isLoaded, isIntro, actions] = useFlipbook Pages
  {togglePlayPause, advance} = actions

  <l.Root className={cx intro: isIntro}>
    {if isLoaded and activePage?
      <Countdown duration={activePage.duration - 100} />
    }
    {Pages.map (Page, i) =>
      mode = cx {
        hide: i < activeIndex or isIntro
        show: i is activeIndex and not isIntro
        preload: i > activeIndex
      }
      <l.PageRoot className={mode}>
        <SwipePage onTickled={advance} onTouched={togglePlayPause}>
          <Page mode={mode} />
        </SwipePage>
      </l.PageRoot>
    }
    <FaeSol onClick={actions.toggleChat} isIntro={isIntro} />
  </l.Root>
