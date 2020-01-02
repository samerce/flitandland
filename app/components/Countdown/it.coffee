import React, {useState, useLayoutEffect} from 'react'

import l from './styled'
import {cx} from '../../utils/style'

export default Countdown = (p) =>
  [classes, setClasses] = useState 'show'
  willChange = =>
    setClasses 'willChange'
    show = => setClasses 'show'
    timer = setTimeout show, 50
    => clearTimeout timer
  useLayoutEffect willChange, [p.duration]
  <l.Countdown
    duration={p.duration}
    className={cx {
      [classes]: yes,
      paused: p.duration <= 0
    }}
  />
