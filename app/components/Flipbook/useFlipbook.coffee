import React, {useState, useLayoutEffect, useEffect} from 'react'
import useBus from '../../hooks/useBus.coffee'
import useLoader from '../Bopz/useLoader.coffee'

DefaultPage = {duration: 0}
PausePage = DefaultPage
export default useFlipbook = (pages) =>
  [index, setIndex] = useState 0
  [page, setPage] = useState {page: DefaultPage}
  [paused, setPaused] = useState yes
  [locked, setLocked] = useState no
  [actions] = useState {}
  [timer, setTimer] = useState {clear: =>}
  [{isLoaded}] = useLoader()

  actions.pause = =>
    setPaused Date.now()
    cast 'flipbook.paused'
  actions.play = =>
    return if locked
    setPaused no
    cast 'flipbook.playing'
  actions.togglePlayPause = =>
    if paused then actions.play()
    else actions.pause()
  actions.advance = =>
    return if index >= pages.length - 1
    cast 'chat.close'
    setIndex (i) => i + 1
    actions.play() if paused

  useLayoutEffect (=>
    return unless index < pages.length - 1 and index >= 0
    newPage = pages[index]
    if paused
      timer.clear()
      setPage page: {...newPage, ...PausePage}
    else # playing
      setPage page: newPage
      setTimer after newPage.duration, =>
        setIndex (i) => i + 1
        if index is pages.length - 1
          after newPage.duration, => cast 'flipbook.closed'
    => timer.clear()
  ), [index, paused]
  useBus
    'sol.opened': =>
      setLocked yes
      actions.pause()
    'sol.closed': =>
      setLocked no
      cast 'chat.close'
      cast 'checkout.close'
      actions.play()

  [page.page, index, isLoaded, actions]
