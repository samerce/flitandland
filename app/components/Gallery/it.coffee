import React, {useRef} from 'react'
import ReactGallery from 'react-image-gallery'

import useScreenSize from '../../hooks/useScreenSize.coffee'
import {getMediaSize} from '../../utils/style'

import {
  Root
} from './styled'

GalleryProps =
  lazyLoad: true
  showThumbnails: false
  showFullscreenButton: false
  showPlayButton: false

export default Gallery = ({items, className = ''}) =>
  {screenHeight} = useScreenSize()
  gallery = useRef()
  size = getMediaSize 1920
  onClick = => gallery._toggleFullScreen()

  <Root size={size} screenHeight={screenHeight}>
    <ReactGallery
      {...GalleryProps}
      className={className}
      items={items}
      ref={gallery}
      onClick={onClick}
    />
  </Root>
