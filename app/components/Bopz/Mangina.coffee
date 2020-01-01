import React, {useState, useLayoutEffect} from 'react'
import DelayedReveal from '../DelayedReveal/it.coffee'

import l from './styled'
import * as c from '../../constants'

export default Mangina = =>
  <l.Root>
    <l.Image src={c.SRC_URL + 'commons/mangina.jpg'} />,
    <DelayedReveal delay={2000}>
      <l.LImage src={c.SRC_URL + 'commons/lampshadelogo.png'} />
    </DelayedReveal>
  </l.Root>
