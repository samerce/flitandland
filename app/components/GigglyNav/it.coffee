import React from 'react'

import {
  Root, Quad, QuadImage, QuadSubtitle, QuadTitle, CenterRoot, Bubble,
  BubbleVideo,
} from './styled'
import {SRC_URL} from '../../constants'

export default class GigglyNav extends React.PureComponent

  render: =>
    <Root>
      <Quad className='topLeft'>
        <QuadImage src={SRC_URL + 'commons/me wig tiny.jpg'} />
        <QuadSubtitle>become a</QuadSubtitle>
        <QuadTitle>flitterer</QuadTitle>
      </Quad>
      <Quad className='topRight'>
        <QuadImage src={SRC_URL + 'commons/streetpoet.jpg'} />
        <QuadTitle>calendar</QuadTitle>
        <QuadSubtitle>find the love near you!</QuadSubtitle>
      </Quad>
      <Quad className='bottomLeft'>
        <QuadImage src={SRC_URL + 'portals/stills/bloom.jpg'} />
        <QuadTitle>support</QuadTitle>
        <QuadSubtitle>the movement</QuadSubtitle>
      </Quad>
      <Quad className='bottomRight'>
        <QuadImage src={SRC_URL + 'portals/stills/jojo.jpg'} />
        <QuadTitle>treasure chest</QuadTitle>
        <QuadSubtitle>ideas, resources & connections</QuadSubtitle>
      </Quad>

      <CenterRoot>
        <Bubble>
          <BubbleVideo
            src={SRC_URL + 'portals/videos/fishypop.mp4'}
            autoPlay={1}
          />
        </Bubble>
      </CenterRoot>
    </Root>
