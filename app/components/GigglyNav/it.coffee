import React, {useState, useEffect} from 'react'
import WhitePaper from '../WhitePaper/it.coffee'
import BouncyPointer from '../BouncyPointer/it.coffee'

import {usePopup} from '../Popup/it.coffee'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import {getMediaSize} from '../../utils/style'
import {scrollIntoView} from '../../utils/nav'

import {
  Root, Quad, QuadImage, QuadSubtitle, QuadTitle, CenterRoot, Bubble,
  BubbleVideo, Logo, VideoRoot
} from './styled'
import {FAL_URL, CDN_URL, SCREEN_WIDTH_M} from '../../constants'

getBubbleSize = (screenWidth) ->
  if screenWidth <= SCREEN_WIDTH_M
    screenWidth * .4
  else screenWidth * .25

Center = =>
  [expanded, setExpanded] = useState false
  {screenWidth} = useScreenSize()
  bubbleSize = getBubbleSize screenWidth
  videoSize = getMediaSize 1920

  <CenterRoot className={'expanded' if expanded} onClick={=> setExpanded not expanded}>
    <Bubble
      size={bubbleSize} videoSize={videoSize}
      onClick={=> setExpanded not expanded}>
      <Logo id='logo'>flit & land</Logo>
      <VideoRoot size={bubbleSize} videoSize={videoSize}>
        <BubbleVideo
          size={videoSize}
          src={CDN_URL + 'flitandland/fizzjuggler.mp4'}
          autoPlay={1} loop={1} muted={not expanded}
        />
      </VideoRoot>
    </Bubble>
  </CenterRoot>

export default GigglyNav = =>
  [s, Popup] = usePopup()
  {screenHeight} = useScreenSize()

  <Root screenHeight={screenHeight}>
    <Quad className='topLeft' onClick={=> Popup.show => <WhitePaper />}>
      <QuadImage src={FAL_URL + 'what/caught!.jpg'} />
      <QuadSubtitle>read the</QuadSubtitle>
      <QuadTitle>white paper</QuadTitle>
    </Quad>
    <Quad className='topRight' onClick={() => scrollIntoView 'join'}>
      <QuadImage src={FAL_URL + 'what/zinisbowie.jpg'} />
      <QuadSubtitle>{"what's"} a</QuadSubtitle>
      <QuadTitle>flitterer?</QuadTitle>
    </Quad>
    <Quad className='bottomLeft' onClick={() => scrollIntoView 'support'}>
      <QuadImage src={FAL_URL + 'cutestfaerie.jpg'} />
      <QuadTitle>wanna play?</QuadTitle>
      <QuadSubtitle>pull up your britches, sally!</QuadSubtitle>
    </Quad>
    <Quad className='bottomRight' onClick={() => scrollIntoView 'treasure'}>
      <QuadImage src={FAL_URL + 'swirl.jpg'} />
      <QuadTitle>treasure chest</QuadTitle>
      <QuadSubtitle>ideas, happenings & resources</QuadSubtitle>
    </Quad>

    <Center />

    <BouncyPointer onClick={() => scrollIntoView 'join'} />
  </Root>
