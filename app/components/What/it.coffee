import React from 'react'
import Gallery from 'react-image-gallery'

import {
  Root, Commercial, PeopleImage, Button,
} from './styled'
import {
  SectionHeader, Body, Subheader, Matrix, MatrixItemIcon,
  MatrixItemTitle, MatrixImage, MatrixItem, MatrixItemContent, MatrixItemText
} from '../../global-styles'

import useScreenSize from '../../hooks/useScreenSize.coffee'

import {SRC_URL} from '../../constants'
import GalleryItems, {GalleryProps} from './config'

export default What = =>
  [screenWidth, screenHeight] = useScreenSize()

  gallery = {}
  onClickGallery = (type) => gallery[type]._toggleFullScreen()

  getVideoSize = =>
    width = Math.min(screenWidth * .9, 1280)
    height: width * (9/16)
    width: width
  getGallerySize = =>
    width = Math.min(screenWidth * .9, 1920)
    height: width * (9/16)
    width: width
    screenHeight: screenHeight

  <Root id='join' gallerySize={getGallerySize()}>
    <SectionHeader>{"what's"} this here thing?</SectionHeader>
    <Subheader>
      the love revolution!
    </Subheader>
    <Commercial size={getVideoSize()} src="https://www.youtube.com/embed/C59QSCVpSuY" frameBorder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen />

    <PeopleImage src={SRC_URL + 'flitandland/moving-people.png'} />

    <Matrix>
      <MatrixItem key='joy'>
        <MatrixImage src={SRC_URL + 'flitandland/joy.png'} />
        <MatrixItemContent>
          <MatrixItemTitle>streets of joy</MatrixItemTitle>
          <MatrixItemText>
            flitter faeries transform their local streets from humdrum, everyday business-as-usual to the fantastic reality of fabulous costumes, circus toys, live theatre, immersive art, humor and just plain fun!
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='dialogue'>
        <MatrixItemContent className='right'>
          <MatrixItemTitle>dialogue for democracy</MatrixItemTitle>
          <MatrixItemText>
            amidst the fabulous flittering, {"you'll"} find faeries making conversation about things that our media misses most. not only are they stewards of love & light on the streets, they are guardians of our democracy and architects of cross-community empathy.
          </MatrixItemText>
        </MatrixItemContent>
        <MatrixImage src={SRC_URL + 'flitandland/laughing.png'} />
      </MatrixItem>

      <Gallery items={GalleryItems.joy} {...GalleryProps}
        ref={(r) => gallery.joy = r}
        onClick={() => onClickGallery('joy')}
      />

      <MatrixItem key='art'>
        <MatrixImage src={SRC_URL + 'flitandland/art-yay.png'} />
        <MatrixItemContent>
          <MatrixItemTitle>nurturing the artist</MatrixItemTitle>
          <MatrixItemText>
            flitterers know that every single human is an artist. {"that's"} why they dream big and bring incredible immersive art to the streets to nurture the artist in themselves and in everyone they meet.
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='knowledge'>
        <MatrixItemContent className='right'>
          <MatrixItemTitle>knowledge for all</MatrixItemTitle>
          <MatrixItemText>
            philosophy and history tell us who we are as a species. learning about these vital subjects can be fun! flitterers use theatre, art, movement, and so much more to bring context and awareness to our place in society today.
          </MatrixItemText>
        </MatrixItemContent>
        <MatrixImage src={SRC_URL + 'flitandland/wisdom.png'} />
      </MatrixItem>

      <MatrixItem key='karma'>
        <MatrixImage src={SRC_URL + 'flitandland/loveheart.png'} />
        <MatrixItemContent>
          <MatrixItemTitle>kind karma</MatrixItemTitle>
          <MatrixItemText>
            capitalism can be rough on the spirit. but flitterers are here to lift you up! {"don't"} be surprised if you find your parking meter filled, your streets free of trash, or your hunger sated with free samples. long live kindness! 🙏
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>
    </Matrix>

    <Gallery items={GalleryItems.art} {...GalleryProps}
      ref={(r) => gallery.art = r}
      onClick={() => onClickGallery('art')}
    />

    <Button>flit with us!</Button>
  </Root>
