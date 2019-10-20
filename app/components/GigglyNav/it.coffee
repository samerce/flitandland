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
import {SRC_URL} from '../../constants'

export default GigglyNav = =>
  [expanded, setExpanded] = useState false
  [s, Popup] = usePopup()
  {screenWidth, screenHeight} = useScreenSize()

  bubbleSize = Math.min (screenWidth * .5), 400
  videoSize = getMediaSize 1280

  <Root screenHeight={screenHeight}>
    <Quad className='topLeft' onClick={=> Popup.show => <WhitePaper />}>
      <QuadImage src={SRC_URL + 'flitandland/what/caught!.jpg'} />
      <QuadSubtitle>read the</QuadSubtitle>
      <QuadTitle>white paper</QuadTitle>
    </Quad>
    <Quad className='topRight' onClick={() => scrollIntoView('join')}>
      <QuadImage src={SRC_URL + 'flitandland/what/zinisbowie.jpg'} />
      <QuadSubtitle>{"what's"} a</QuadSubtitle>
      <QuadTitle>flitterer?</QuadTitle>
    </Quad>
    <Quad className='bottomLeft' onClick={() => scrollIntoView('support')}>
      <QuadImage src={SRC_URL + 'flitandland/what/cutestfaerie.jpg'} />
      <QuadTitle>wanna play?</QuadTitle>
      <QuadSubtitle>pull up your britches, sally!</QuadSubtitle>
    </Quad>
    <Quad className='bottomRight' onClick={() => scrollIntoView('treasure')}>
      <QuadImage src={SRC_URL + 'portals/stills/jojo.jpg'} />
      <QuadTitle>treasure chest</QuadTitle>
      <QuadSubtitle>ideas, happenings & resources</QuadSubtitle>
    </Quad>

    <CenterRoot>
      <Bubble className={'expanded' if expanded}
        size={bubbleSize} videoSize={videoSize}
        onClick={=> setExpanded not expanded}>
        <Logo id='logo'>flit & land</Logo>
        <VideoRoot size={bubbleSize} videoSize={videoSize}>
          <BubbleVideo
            size={videoSize}
            src={SRC_URL + 'flitandland/fizzjuggler.mp4'}
            autoPlay={1} loop={1} muted={not expanded}
          />
        </VideoRoot>
      </Bubble>
    </CenterRoot>

    <BouncyPointer onClick={() => onClickQuad 'join'} />
  </Root>
