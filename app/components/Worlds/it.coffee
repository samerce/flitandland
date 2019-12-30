import React from 'react'
import MailingList from '../MailingList/it.coffee'

import * as l from './styled'
import * as c from '../../constants'

import useNav from '../../hooks/useNav.coffee'

VideoUrl = c.SRC_URL + 'videos/'

export default Worlds = =>
  [{view}, Nav] = useNav()
  <l.Root className={view? and 'hide'}>
    <l.Poker onClick={() => Nav.show 'poker'}>
      <video className='gift' loop={1} playsInline autoPlay muted
        src={VideoUrl + 'pokerQ.mp4'}
      />
      <l.WorldImg src={c.SRC_URL + 'commons/poker.png'} />
    </l.Poker>
    <l.Lampshade onClick={() => Nav.show 'lampshade'}>
      <video className='gift' loop={1} playsInline autoPlay muted
        src={VideoUrl + 'danceQ.mp4'}
      />
      <l.WorldImg src={c.SRC_URL + 'commons/lampshadelogo.png'} />
    </l.Lampshade>
    <l.EymU onClick={() => Nav.show 'eymu'}>
      <video className='gift' loop={1} playsInline autoPlay muted
        src={VideoUrl + 'what happens hereQ.mp4'}
      />
      <l.WorldImg src={c.SRC_URL + 'commons/eymuhelix.png'} />
    </l.EymU>

    <l.ComingSoon src={c.SRC_URL + 'commons/comingsoon!!.png'} />
    <MailingList />
  </l.Root>
