import React, {useState, useMemo, useLayoutEffect} from 'react'

import l from './styled'
import {cx} from '../../utils/style'

import {useSpring, a, config} from 'react-spring'
import {useDrag} from 'react-use-gesture'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import useBus from '../../hooks/useBus.coffee'

phys =
  mass: 1
  tension: 201
  friction: 26
export default Sheet = (p) =>
  [opened, setOpened] = useState no
  [dragging, setDragging] = useState no
  {screenHeight} = useScreenSize()
  thresholdY = useMemo (=> screenHeight / 3), [screenHeight]
  offscreenY = useMemo (=> -screenHeight * 1.2), [screenHeight]
  [{y}, setit] = useSpring => y: offscreenY

  open = (canceled) =>
    setit y: 0, config: phys
    setOpened yes
  close = (velocity = 0) =>
    setit y: offscreenY, config: {...phys, velocity}
    setOpened no

  # handleDrag =
  #   ({first, last, vxvy: [, vy], movement: [, my], cancel, canceled}) =>
  #     setDragging(first and not last)
  #
  #     # if the user drags up passed a threshold, then cancel
  #     if my > 70 then cancel()
  #
  #     # check if it passed the threshold on release
  #     if last
  #       if my < thresholdY or vy > 0.5
  #         # close(vy)
  #       else open(canceled)
  #     # else just move the sheet with the user's input
  #     else setit y: my, immediate: no, config: phys
  # withDrag = useDrag(handleDrag,
  #   {initial: (=> [0, y.get()]), bounds: {top: 0}, rubberband: true}
  # )

  useBus
    [p.openCast]: => open()
    [p.closeCast]: => close()

  <l.SheetRoot {...p} className={cx [p.className]: yes, open: opened}>
    <a.div className='bg' onClick={=> cast p.closeCast} style={{
      opacity: y.to [offscreenY, 0], [0, 1], 'clamp'
      touchAction: if opened then 'auto' else 'none'
      pointerEvents: if opened then 'all' else 'none'
    }} />
    <a.div
      className={cx sheet: yes} style={{y}}>
      {p.children}
    </a.div>
    <l.Close>close</l.Close>
  </l.SheetRoot>
