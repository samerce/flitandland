import React from 'react'

import l from './styled'
import * as c from '../../constants'

import useNav from '../../hooks/useNav.coffee'

export default NavCloseButton = =>
  [{view}, Nav] = useNav()
  <l.Root
    className={view? and 'show'}
    onClick={Nav.hide}>
    close
  </l.Root>
