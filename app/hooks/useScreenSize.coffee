import React, {useState, useEffect} from 'react'

import {throttle} from 'lodash'

export default useScreenSize = =>
  [screenWidth, setWidth] = useState window.innerWidth
  [screenHeight, setHeight] = useState window.innerHeight

  useEffect =>
    onResize = =>
      setWidth(window.innerWidth)
      setHeight(window.innerHeight)
    onResizeThrottled = throttle onResize, 100
    window.addEventListener 'resize', onResizeThrottled
    => window.removeEventListener 'resize', onResizeThrottled

  [screenWidth, screenHeight]
