import React from 'react'
import WhitePaper from '../WhitePaper/it.coffee'

import {usePopup} from '../Popup/it.coffee'

import {
  Root, Quad, QuadImage, QuadSubtitle, QuadTitle, CenterRoot, Bubble,
  BubbleVideo,
} from './styled'
import {SRC_URL} from '../../constants'

export default GigglyNav = =>
  [s, popupActions] = usePopup()
  onClickQuad = (sectionId) =>
    document.getElementById(sectionId).scrollIntoView(behavior: 'smooth')

  <Root>
    <Quad className='topRight' onClick={=> popupActions.show => <WhitePaper />}>
      <QuadImage src={SRC_URL + 'commons/streetpoet.jpg'} />
      <QuadSubtitle>read the</QuadSubtitle>
      <QuadTitle>white paper</QuadTitle>
    </Quad>
    <Quad className='topLeft' onClick={() => onClickQuad('join')}>
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
      <Bubble>
        <BubbleVideo
          src={SRC_URL + 'portals/videos/fishypop.mp4'}
          autoPlay={yes} loop={yes}
        />
      </Bubble>
    </CenterRoot>
  </Root>
