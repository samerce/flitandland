import React, {useState, useRef, useLayoutEffect} from 'react'

export default useFlipbook = (pages, useLoader) =>
  [index, setIndex] = useState -1
  [page, setPage] = useState {page: null}
  [paused, setPaused] = useState yes
  [actions] = useState {}
  [timer, setTimer] = useState {clear: =>}
  [{isLoaded}] = useLoader()

  useLayoutEffect (=> setIndex 0 if isLoaded), [isLoaded]
  useLayoutEffect (=>
    return unless index < pages.length - 1 and index >= 0
    newPage = pages[index]
    if paused
      setPage page: {...newPage, duration: 0}
    else
      setPage page: newPage
      setTimer after newPage.duration, => setIndex (i) => i + 1
    => timer.clear()
  ), [index, paused]

  actions.pause = => setPaused Date.now()
  actions.play = => setPaused no
  actions.togglePlayPause = =>
    if paused then actions.play()
    else actions.pause()
  actions.advance = =>
    return if index >= pages.length - 1
    setIndex (i) => i + 1
    actions.play() if paused

  [page.page, index, actions]
