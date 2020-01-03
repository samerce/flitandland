import React from 'react'

import l from './styled'
import * as c from '../../constants'

FaeButton = (p) =>
  <l.Root className={p.className} delay={p.delay || 0}>
    {p.children}
  </l.Root>

export default (p) => <FaeButton delay={Math.random() * 2} {...p} />
