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
      from: {opacity: 1, transform: 'translate(0, 0)'}
      to: {opacity: 0, transform: 'translate(0, 36px)'}
  show = (innards) =>
    timer.clear() if timer
    if visible
      hide()
      setTimer after 300, => show(innards)
    else
      setVisible yes
      setInnards innards
      setAnim
        from: {opacity: 0, transform: 'translate(0, 36px)', filter: 'blur(10px)'}
        to: {opacity: 1, transform: 'translate(0, 0)', filter: 'blur(0)'}

  useLayoutEffect (=>
    listen 'fal.announcer.show', (e) => show(e.detail)
    listen 'fal.announcer.hide', hide
  ), []

  <l.Root>
    <l.Go style={style}>
      {
        if typeof innards is 'string'
          <div>{innards}</div>
        else innards || ''
      }
    </l.Go>
  </l.Root>

# else
#   <l.Go style={style}>
#     <i className='fa fa-spinner' />
#     <div>still decorating, gimme a sec...</div>
#   </l.Go>
