import React, {useState, useEffect} from 'react'

import {throttle} from 'lodash'
import useBus from './useBus.coffee'

export default =>
  [screenWidth, setWidth] = useState window.innerWidth
  [screenHeight, setHeight] = useState window.innerHeight
  shape =
    if screenWidth > screenHeight then 'landscape'
    else 'portrait'

  useBus
    resize: throttle (=>
      setWidth window.innerWidth
      setHeight window.innerHeight
    ), 100
  {screenWidth, screenHeight, shape}
