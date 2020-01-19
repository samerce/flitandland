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
  [isLoaded] = useLoader()

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
    return if index >= pages.length
    newIndex = index + 1
    setIndex newIndex
    if newIndex is pages.length then cast 'flipbook.closed'

    cast 'chat.close'
    cast 'checkout.close'
    actions.play() if paused

  useLayoutEffect (=>
    return unless index < pages.length and index >= 0
    newPage = pages[index]
    if paused
      setPage page: {...newPage, ...PausePage}
    else
      setPage page: newPage
      setTimer after newPage.duration, actions.advance
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
