import React, {useState, useLayoutEffect} from 'react'

import * as c from '../constants'

export default (start, delay, hideDelay) =>
  [classes, setClasses] = useState 'hide'

  setTimers = =>
    return unless start
    timers = []

    willShow = => setClasses 'willShow'
    timers.push setTimeout willShow, delay - 50

    show = => setClasses 'show'
    timers.push setTimeout show, delay

    if hideDelay
      hide = => setClasses 'hide'
      timers.push setTimeout hide, hideDelay
    => clearTimeout timer for timer in timers
  useLayoutEffect setTimers, [start]

  [classes]
