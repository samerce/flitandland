import React from 'react'
import MailingList from '../MailingList/it.coffee'

import * as l from './styled'
import * as c from '../../constants'

VideoUrl = c.SRC_URL + 'videos/'



export default Worlds = =>
  <l.Root>
    <l.Poker>
      <video className='gift' loop={1} playsInline={1} autoPlay={1} muted
        src={VideoUrl + 'pokerQ.mp4'}
      />
      <l.WorldImg src={c.SRC_URL + 'commons/poker.png'} />
    </l.Poker>
    <l.Lampshade>
      <video className='gift' loop={1} playsInline={1} autoPlay={1} muted
        src={VideoUrl + 'danceQ.mp4'}
      />
      <l.WorldImg src={c.SRC_URL + 'commons/lampshadelogo.png'} />
    </l.Lampshade>
    <l.EymU>
      <video className='gift' loop={1} playsInline={1} autoPlay={1} muted
        src={VideoUrl + 'what happens hereQ.mp4'}
      />
      <l.WorldImg src={c.SRC_URL + 'commons/eymuhelix.png'} />
    </l.EymU>
    <l.ComingSoon src={c.SRC_URL + 'commons/comingsoon!!.png'} />
    <MailingList />
  </l.Root>
