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

import {FAL_URL} from '../../constants'
import GalleryItems, {GalleryProps} from './config'

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

    <PeopleImage src={FAL_URL + 'moving-people.png'} />

    <Matrix>
      <MatrixItem key='joy'>
        <SocialMatrixImage
          src={FAL_URL + 'mikeyfizzwhimzeh.jpg'}
          emoji={['🌞', '🌈', '🧚🏽‍♂️', '💪🏽', '🔮']}
        />
        <MatrixItemContent>
          <MatrixItemTitle>
            <E>now</E> leaves no space for <E>until</E>
          </MatrixItemTitle>
          <MatrixItemText>
            mikey and fizz are <E>flittering the streets</E> of nyc! get into it, henny: NOW is always the best time to confront fear and be bold. these two bring you fantastic costumes, glamorous drag, and toys the circus would envy—all wrapped up in some hilarious immersive theatre, sitting on a cloud of ecstasy!
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='dialogue' className='right'>
        <SocialMatrixImage
          src={FAL_URL + 'unrigtrio.jpg'}
          likes={316}
          emoji={['🙏', '🤓', '🤩', '🌬', '✨']}
        />
        <MatrixItemContent>
          <MatrixItemTitle>
            we are what we <E>will</E>
          </MatrixItemTitle>
          <MatrixItemText>
            fizz and bubbles flit into unrig summit to sprinkle some wigs, wonder, and whimsy! <E>dialogue for democracy</E> can be energizing, light-hearted and heart-centered. these flitterers bring to light what the media misses most. not only are they gentle guardians of democracy, they are anytime architects of cross-community empathy.
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='art'>
        <SocialMatrixImage
          src={FAL_URL + 'what/kristyfizz.jpg'}
          likes={320}
          emoji={['🎷', '🏮', '🌝', '🌴']}
        />
        <MatrixItemContent>
          <MatrixItemTitle>
            more <E>danger</E>, less comfort
          </MatrixItemTitle>
          <MatrixItemText>
            flitterers fizz and kristy {"aren't"} afraid to get queer. it has been said that <E>important art comes from fear.</E> today {"you'll"} find these fabulous creatures at the corner of beverly & fairfax where a whole block has been converted into a fab red-carpet runway! come get silly and let go of your queer fears!
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='knowledge' className='right'>
        <SocialMatrixImage
          src={FAL_URL + 'what/silverqueen.jpg'}
          emoji={['📚', '🙇🏽‍♀️', '💞']}
          likes={319}
        />
        <MatrixItemContent>
          <MatrixItemTitle>math_bending <E>miracle&nbsp;humans</E></MatrixItemTitle>
          <MatrixItemText>
            this is jojo. a magical mystery of the highest order, their one-person show covers ground from the first philosophy, the i ching, to thoughts on artificial intelligence. they bring fab drag, wild toys & psychedelic art for an immersive experience <E>challenging traditional views of reality.</E>
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem key='karma'>
        <SocialMatrixImage
          src={FAL_URL + 'what/goofqueenlovers.jpg'}
          emoji={['👭', '👬', '👫', '👩🏽', '🙏']}
          likes={329}
        />
        <MatrixItemContent>
          <MatrixItemTitle><E>love</E> is so freakin powerful</MatrixItemTitle>
          <MatrixItemText>
            {"here's"} fizz and bubbles again! this time {"they're"} dead-set on proving that love is bigger than profit$. {"don't"} be surprised if you find your parking meter filled, your streets free of trash, or your hunger sated with free samples. long live kindness!
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>
    </Matrix>

    <Gallery items={GalleryItems} />

    <Button onClick={onClickFlit}>flit with us!</Button>
  </Root>
