import React from 'react'

import l from './styled'
import * as c from '../../constants'
import Floors from './config'

import useNav from '../../hooks/useNav.coffee'

ContentRenderers =
  vid: (p) => <l.Video {...p} autoPlay playsInline loop={1} muted />
  pic: (p) => <l.Image {...p} />

export default Eymuland = =>
  [{view}, Nav] = useNav()
  <l.Root className={(view is 'eymu') and 'show'}>
    <l.Title>eymU</l.Title>
    <l.Building>
      {Floors.map (f) =>
        <l.Row>
          {ContentRenderers[f.type](f)}
        </l.Row>
      }
    </l.Building>
  </l.Root>
