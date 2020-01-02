import React, {useState, useLayoutEffect} from 'react'
import useGlobal from 'use-global-hook'

useIndex = useGlobal(React,
  {index: -1},
  setIndex: ({setState}, index) => setState {index}
)

timer = null
export default useFlipbook = (pages, useLoader) =>
  [{index}, {setIndex}] = useIndex()
  [{paused, page}, setState] = useState {page: no, paused: no}
  [{isLoaded}] = useLoader()

  onLoad = => setIndex 0 if isLoaded
  useLayoutEffect onLoad, [isLoaded]

  inflatePage = =>
    newPage = pages[index]
    setState page: newPage
    if not paused
      advanceIndex = => setIndex index + 1
      timer = setTimeout advanceIndex, newPage.duration

  inflate = =>
    clearTimeout timer
    inflatePage() if index < pages.length - 1 and index >= 0 and not paused
    => clearTimeout timer
  useLayoutEffect inflate, [index, paused]

  pause = =>
    setState page: {...page, duration: 0}, paused: Date.now()
  play = =>
    setState paused: no
  togglePlayPause = =>
    if paused then play()
    else pause()
  advance = =>
    return if index >= pages.length - 1
    setIndex index + 1
    play() if paused

  [page, index, togglePlayPause, advance, pause, play]
