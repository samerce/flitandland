import React, {useState, useLayoutEffect} from 'react'
import Sheet from '../Sheet/it.coffee'

import l from './styled'
import {cx} from '../../utils/style'

import useBus from '../../hooks/useBus.coffee'

export default ContactUs = (p) =>
  [open, setOpen] = useState no
  useBus
    'contactus.open': => setOpen yes

  <Sheet open={open} style={{zIndex: 9000}}>
    <div>send us a message!</div>
  </Sheet>
