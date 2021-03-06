import React, {useState, useLayoutEffect} from 'react'

import l from './styled'
import * as c from '../../constants'
import {useSpring} from 'react-spring'

export default Announcer = =>
  [innards, setInnards] = useState()
  [visible, setVisible] = useState no
  [timer, setTimer] = useState()
  [anim, setAnim] = useState from: {opacity: 0}, to: {opacity: 0}
  style = useSpring {...anim}

  hide = =>
    timer.clear() if timer
    setVisible false
    setAnim
      from: {opacity: 1, y: 0}
      to: {opacity: 0, y: 36}
  show = (p) =>
    timer.clear() if timer
    if visible
      hide()
      setTimer after 300, => show(p)
    else
      setVisible yes
      setInnards p.content
      setAnim
        from: {opacity: 0, y: 36}
        to: {opacity: 1, y: 0}

  useLayoutEffect (=>
    listen 'fal.announcer.show', show
    listen 'fal.announcer.hide', hide
    =>
      deafen 'fal.announcer.show', showHandler
      deafen 'fal.announcer.hide', hide
      timer.clear() if timer?
  ), []

  <l.Root>
    <l.Go style={{
      ...style, transform: "translate(0, #{style.y}px)"
    }}>
      {
        if typeof innards is 'string'
          <div>{innards}</div>
        else innards || ''
      }
    </l.Go>
  </l.Root>
