import React from 'react'

import {
  Root, Quad, QuadImage, QuadSubtitle, QuadTitle, CenterRoot, Bubble,
  BubbleVideo,
} from './styled'
import {SRC_URL} from '../../constants'

export default class GigglyNav extends React.PureComponent

  render: =>
    <Root>
      <Quad className='topLeft' onClick={() => @onClickQuad('join')}>
        <QuadImage src={SRC_URL + 'commons/me wig tiny.jpg'} />
        <QuadSubtitle>become a</QuadSubtitle>
        <QuadTitle>flitterer</QuadTitle>
      </Quad>
      <Quad className='topRight' onClick={() => @onClickQuad('calendar')}>
        <QuadImage src={SRC_URL + 'commons/streetpoet.jpg'} />
        <QuadSubtitle>realtime</QuadSubtitle>
        <QuadTitle>calendar</QuadTitle>
      </Quad>
      <Quad className='bottomLeft' onClick={() => @onClickQuad('support')}>
        <QuadImage src={SRC_URL + 'portals/stills/bloom.jpg'} />
        <QuadTitle>support</QuadTitle>
        <QuadSubtitle>the movement</QuadSubtitle>
      </Quad>
      <Quad className='bottomRight' onClick={() => @onClickQuad('treasure')}>
        <QuadImage src={SRC_URL + 'portals/stills/jojo.jpg'} />
        <QuadTitle>treasure chest</QuadTitle>
        <QuadSubtitle>ideas, resources & connections</QuadSubtitle>
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

  onClickQuad: (sectionId) =>
    document.getElementById(sectionId).scrollIntoView(behavior: 'smooth')
