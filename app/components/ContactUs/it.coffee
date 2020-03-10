import React, {useState, useLayoutEffect} from 'react'
import Sheet from '../Sheet/it.coffee'

import l from './styled'
import {cx} from '../../utils/style'

import useBus from '../../hooks/useBus.coffee'

OpenCast = 'contactus.open'
CloseCast = 'contactus.close'
export default ContactUs = (p) =>
  <Sheet openCast={OpenCast} closeCast={CloseCast} style={{zIndex: 9000}}>
    <div>send us a message!</div>
  </Sheet>
