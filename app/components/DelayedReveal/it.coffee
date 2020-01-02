import React, {useState, useLayoutEffect} from 'react'

import l from './styled'
import * as c from '../../constants'

export default DelayedReveal = (p) =>
  [classes, setClasses] = useState 'hide'

  setTimers = =>
    return if p.start is no
    timers = []

    willShow = => setClasses 'willShow'
    timers.push setTimeout willShow, p.delay - 50

    show = => setClasses 'show'
    timers.push setTimeout show, p.delay

    if p.hideDelay
      hide = => setClasses 'hide'
      timers.push setTimeout hide, p.hideDelay
    => clearTimeout timer for timer in timers
  useLayoutEffect setTimers, [p.start]

  <l.Root className={classes}>
    {p.children}
  </l.Root>
