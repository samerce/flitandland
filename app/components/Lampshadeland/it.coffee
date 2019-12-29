import React from 'react'

import l from './styled'
import * as c from '../../constants'
import Diamonds from './config'

import useNav from '../../hooks/useNav.coffee'

ContentRenderers =
  vid: (p) => <l.Video {...p} autoPlay playsInline loop={1} muted />
  pic: (p) => <l.Image {...p} />

export default Lampshadeland = =>
  [{view}, Nav] = useNav()
  <l.Root className={(view is 'lampshade') and 'show'}>
    {Diamonds.map (d) =>
      <l.Diamond>
        <l.Content>
          {ContentRenderers[d.type](d)}
        </l.Content>
      </l.Diamond>
    }
  </l.Root>
