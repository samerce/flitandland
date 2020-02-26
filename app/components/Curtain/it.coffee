import React from 'react'

import l from './styled'
import * as c from '../../constants'

export default Curtain = =>
  <l.Root>
    {<l.Fold i={i} /> for i in [0..20]}
  </l.Root>
