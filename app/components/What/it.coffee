import React from 'react'
import Gallery from '../Gallery/it.coffee'
import SocialMatrixImage from '../SocialMatrixImage/it.coffee'

import {
  Root, Commercial, PeopleImage, Button, MatrixImage,
} from './styled'
import {
  SectionHeader, Body, Subheader, Matrix, MatrixItemIcon,
  MatrixItemTitle, MatrixItem, MatrixItemContent, MatrixItemText, E
} from '../../global-styles'

import {usePopup} from '../Popup/it.coffee'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import {getMediaSize} from '../../utils/style'

import {SRC_URL as _SRC_URL} from '../../constants'
import GalleryItems, {GalleryProps} from './config'

SRC_URL = _SRC_URL + 'flitandland/'
SignUpForm = <iframe src="https://docs.google.com/forms/d/e/1FAIpQLScvGnPFbBsV_led5hVSjnsxh-1T60ZefMceQftpW9u8kUm_YA/viewform?embedded=true" width="100%" height="100%" frameBorder="0" marginHeight="0" marginWidth="0">Loading…</iframe>

CommercialVideo = =>
  useScreenSize()
  <Commercial size={getMediaSize 1280} src="https://www.youtube.com/embed/C59QSCVpSuY" frameBorder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowFullScreen />

export default What = =>
  [s, Popup] = usePopup()
  onClickFlit = => Popup.show => SignUpForm

  <Root id='join'>
    <SectionHeader>{"what's"} this here thing?</SectionHeader>
    <Subheader>
      a love vortex!
    </Subheader>
    <CommercialVideo />

    <PeopleImage src={SRC_URL + 'moving-people.png'} />

    <Matrix>
      <MatrixItem key='joy'>
        <SocialMatrixImage
          src={SRC_URL + 'what/mikeyfizzwhimzeh.jpg'}
          emoji={['🌞', '🌈', '🧚🏽‍♂️', '💪🏽', '🔮']}
        />
        <MatrixItemContent>
          <MatrixItemTitle>
            <E>now</E> leaves no space for <E>until</E>
          </MatrixItemTitle>
          <MatrixItemText>
            flitter faeries transform their local streets from humdrum, everyday business-as-usual to the fantastic reality of fabulous costumes, circus toys, live theatre, immersive art, humor and just plain fun!
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='dialogue' className='right'>
        <SocialMatrixImage
          src={SRC_URL + 'what/merman.jpg'}
          likes={316}
          emoji={['🙏', '🤓', '🤩', '🌬', '✨']}
        />
        <MatrixItemContent>
          <MatrixItemTitle>
            more <E>danger</E>, less comfort
          </MatrixItemTitle>
          <MatrixItemText>
            amidst the fabulous flittering, {"you'll"} find dialogue for <E>democracy</E>.<br /> faeries chat about what the media misses most. not only are they street stewards of love & light, they are anytime guardians of democracy and architects of cross-community empathy.
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <Gallery items={GalleryItems.joy} />

      <MatrixItem key='art'>
        <SocialMatrixImage
          src={SRC_URL + 'what/kristyfizz.jpg'}
          likes={320}
          emoji={['🎷', '🏮', '🌝', '🌴']}
        />
        <MatrixItemContent>
          <MatrixItemTitle>
            we are what we <E>will</E>
          </MatrixItemTitle>
          <MatrixItemText>
            flitterers know that every single human is an artist. {"that's"} why they dream big and bring incredible immersive art to the streets to nurture the artist in themselves and in everyone they meet.
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='knowledge' className='right'>
        <SocialMatrixImage
          src={SRC_URL + 'what/silverqueen.jpg'}
          emoji={['📚', '🙇🏽‍♀️', '💞']}
          likes={319}
        />
        <MatrixItemContent>
          <MatrixItemTitle>math_bending <E>miracle&nbsp;humans</E></MatrixItemTitle>
          <MatrixItemText>
            philosophy and history tell us who we are as a species. learning about these vital subjects can be fun! flitterers use theatre, art, movement, and so much more to bring context and awareness to our place in society today.
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='karma'>
        <SocialMatrixImage
          src={SRC_URL + 'what/goofqueenlovers.jpg'}
          emoji={['👭', '👬', '👫', '🏃🏽‍♀️']}
          likes={329}
        />
        <MatrixItemContent>
          <MatrixItemTitle><E>love</E> is so freakin powerful</MatrixItemTitle>
          <MatrixItemText>
            capitalism can be rough on the spirit. but flitterers are here to lift you up! {"don't"} be surprised if you find your parking meter filled, your streets free of trash, or your hunger sated with free samples. long live kindness! 🙏
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>
    </Matrix>

    <Gallery items={GalleryItems.art} />

    <Button onClick={onClickFlit}>flit with us!</Button>
  </Root>
