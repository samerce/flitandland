import React, {useState, useLayoutEffect} from 'react'

import l from './styled'

export default Countdown = (p) =>
  [classes, setClasses] = useState 'show'
  show = => setClasses 'show'
  willChange = =>
    setClasses 'willChange'
    timer = setTimeout show, 50
    => clearTimeout timer
  useLayoutEffect willChange, [p.duration]
  <l.Countdown duration={p.duration} className={classes} />
