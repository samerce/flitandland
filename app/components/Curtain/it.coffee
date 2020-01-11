import React from 'react'

import l from './styled'
import * as c from '../../constants'

export default Curtain = =>
  <l.Root onClick={=> dispatch 'fal.bgWasClicked'}>
    {<l.Fold i={i} /> for i in [0..10]}
  </l.Root>
