import React, {useState, useMemo, useEffect, useLayoutEffect} from 'react'

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

  open = =>
    setit y: 0, config: phys
    setOpened yes
  close = =>
    setit y: offscreenY, config: {...phys}
    setOpened no

  useBus
    [p.openCast]: =>
      if p.keepPreviousUrl
        window.location = window.location.hash + '/' + p.url
      else window.location.hash = p.url
    [p.closeCast]: =>
      replace = p.url
      if p.keepPreviousUrl then replace = '/' + p.url
      window.location = window.location.hash.replace replace, ''

  useEffect (=>
    cast 'hashHandler.add', {
      trigger: p.url
      onEnter: => open()
      onChange: =>
      onExit: => close()
    }
  ), []

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
