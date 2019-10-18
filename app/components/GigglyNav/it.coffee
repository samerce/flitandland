import React, {useState, useEffect} from 'react'
import WhitePaper from '../WhitePaper/it.coffee'

import {usePopup} from '../Popup/it.coffee'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import {getMediaSize} from '../../utils/style'

import {
  Root, Quad, QuadImage, QuadSubtitle, QuadTitle, CenterRoot, Bubble,
  BubbleVideo, Logo, VideoRoot,
} from './styled'
import {SRC_URL} from '../../constants'

export default GigglyNav = =>
  [expanded, setExpanded] = useState false
  [s, popupActions] = usePopup()
  [screenWidth] = useScreenSize()

  bubbleSize = Math.min screenWidth, 400
  videoSize = getMediaSize 1280
  onClickQuad = (sectionId) =>
    document.getElementById(sectionId).scrollIntoView(behavior: 'smooth')

  <Root>
    <Quad className='topLeft' onClick={=> popupActions.show => <WhitePaper />}>
      <QuadImage src={SRC_URL + 'commons/streetpoet.jpg'} />
      <QuadSubtitle>read the</QuadSubtitle>
      <QuadTitle>white paper</QuadTitle>
    </Quad>
    <Quad className='topRight' onClick={() => onClickQuad('join')}>
      <QuadImage src={SRC_URL + 'commons/me wig tiny.jpg'} />
      <QuadSubtitle>become a</QuadSubtitle>
      <QuadTitle>flitterer</QuadTitle>
    </Quad>
    <Quad className='bottomLeft' onClick={() => onClickQuad('support')}>
      <QuadImage src={SRC_URL + 'portals/stills/bloom.jpg'} />
      <QuadTitle>support</QuadTitle>
      <QuadSubtitle>the movement</QuadSubtitle>
    </Quad>
    <Quad className='bottomRight' onClick={() => onClickQuad('treasure')}>
      <QuadImage src={SRC_URL + 'portals/stills/jojo.jpg'} />
      <QuadTitle>treasure chest</QuadTitle>
      <QuadSubtitle>ideas, resources & happenings</QuadSubtitle>
    </Quad>

    <CenterRoot>
      <Bubble className={'expanded' if expanded}
        size={bubbleSize} videoSize={videoSize}
        onClick={=> setExpanded not expanded}>
        <Logo id='logo'>flit & land</Logo>
        <VideoRoot size={bubbleSize} videoSize={videoSize}>
          <BubbleVideo
            size={videoSize}
            src={SRC_URL + 'portals/videos/fishypop.mp4'}
            autoPlay={1} loop={1} muted={not expanded}
          />
        </VideoRoot>
      </Bubble>
    </CenterRoot>
  </Root>
