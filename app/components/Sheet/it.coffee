import React, {useState, useMemo, useLayoutEffect} from 'react'

import l from './styled'
import {cx} from '../../utils/style'

import {useSpring, a, config} from 'react-spring'
import {useDrag} from 'react-use-gesture'
import useScreenSize from '../../hooks/useScreenSize.coffee'

export default Sheet = (p) =>
  [dragging, setDragging] = useState no
  {screenHeight} = useScreenSize()
  thresholdY = useMemo (=> screenHeight / 3), [screenHeight]
  offscreenY = useMemo (=> -screenHeight * 1.2), [screenHeight]
  [{y}, setit] = useSpring => y: offscreenY

  open = (canceled) =>
    setit y: 0, config: if canceled then config.wobbly else config.stiff
  close = (velocity = 0) =>
    setit y: offscreenY, config: {...config.stiff, velocity}

  handleDrag =
    ({first, last, vxvy: [, vy], movement: [, my], cancel, canceled}) =>
      setDragging(first and not last)

      # if the user drags up passed a threshold, then cancel
      if my > 70 then cancel()

      # check if it passed the threshold on release
      if last
        if my < thresholdY or vy > 0.5
          # close(vy)
        else open(canceled)
      # else just move the sheet with the user's input
      else setit y: my, immediate: no, config: config.stiff
  withDrag = useDrag(handleDrag,
    {initial: (=> [0, y.get()]), bounds: {top: 0}, rubberband: true}
  )

  useLayoutEffect (=>
    if p.open then open()
    else close()
  ), [p.open]

  <l.SheetRoot className={cx [p.className]: yes, open: p.open} style={p.style}>
    <a.div className='bg' onClick={close} style={{
      opacity: y.to [offscreenY, 0], [0, 1], 'clamp'
      touchAction: if p.open then 'auto' else 'none'
      pointerEvents: if p.open then 'all' else 'none'
    }} />
    <a.div {...withDrag()}
      className={cx sheet: yes} style={{y}}>
      {p.children}
    </a.div>
  </l.SheetRoot>
