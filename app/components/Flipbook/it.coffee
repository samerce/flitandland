import React, {useLayoutEffect, useState} from 'react'
import Countdown from '../Countdown/it.coffee'
import FaeButton from '../FaeButton/it.coffee'

import l from './styled'
import * as c from '../../constants'
import {cx} from '../../utils/style'

import useFlipbook from './useFlipbook.coffee'
import useLoader from '../Bopz/useLoader.coffee'
import useIntro from '../../hooks/useIntro.coffee'
import useChat from '../../hooks/useChat.coffee'
import { useSpring, animated } from 'react-spring'
import { useDrag } from 'react-use-gesture'

import * as PagesMap from '../Bopz/Mangina.coffee'
Pages = Object.values(PagesMap)

FaeButtons = (p) =>
  [{isIntro}] = useIntro()
  [isTinkerbellTickled, setIsTinkerbellTickled] = useState no
  classes = cx {
    'flipbook-button': yes
    intro: isIntro
    disabled: isIntro
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
      <l.Yes>🧞‍</l.Yes>
    </FaeButton>
    <FaeButton className={classes + ' no'}>
      <l.No>🦠</l.No>
    </FaeButton>
    <FaeButton className={classes + ' nails'}>
      <l.Nails onClick={p.toggleChat}>🍄</l.Nails>
      <l.IntroText>hi! {"i'm"} pillo. {"i'm"} the fiber optics of communication.</l.IntroText>
    </FaeButton>
  </>


SwipePage = (p) =>
  [{ x, y }, setit] = useSpring => x: 0, y: 0
  withDrag = useDrag ({ first, down, movement: [mx, my] }) =>
    if down
      setit {x: mx, y: my}
    else if mx < -100 or my < -100
      p.onTickled()
    else if Math.abs(mx) < 10 or Math.abs(my) < 10
      p.onTouched()

  <animated.div {...withDrag()} x={x.value} y ={y.value} className='swipe-page'>
    {p.children}
  </animated.div>

export default Flipbook = =>
  [activePage, activeIndex, actions] = useFlipbook Pages, useLoader
  [{isLoaded}] = useLoader()
  [{isIntro}] = useIntro()
  [isChatOpen, setIsChatOpen] = useState no
  {onChatOpen, onChatClose, closeChat, openChat} = useChat()
  {togglePlayPause, advance, pause, play} = actions

  useLayoutEffect (=>
    onChatOpen => setIsChatOpen yes
    onChatClose => setIsChatOpen no
    undefined
  ), []

  onChatChange = =>
    closeChat() if isIntro and isChatOpen
    return if isIntro
    if isChatOpen then pause()
    else play()
  useLayoutEffect onChatChange, [isChatOpen]

  startFlipbook = => play() unless isIntro or isChatOpen
  useLayoutEffect startFlipbook, [isIntro]

  next = =>
    closeChat()
    advance()
  toggleChat = =>
    if isChatOpen then closeChat()
    else openChat()

  <l.Root>
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
        <SwipePage onTickled={next} onTouched={togglePlayPause}>
          <Page mode={mode} />
        </SwipePage>
      </l.PageRoot>
    }
    <FaeButtons play={play} pause={pause} next={next} toggleChat={toggleChat} />
  </l.Root>
