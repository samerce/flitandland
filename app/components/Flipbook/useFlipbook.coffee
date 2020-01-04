import React, {useState, useLayoutEffect} from 'react'
import useGlobal from 'use-global-hook'

useIndex = useGlobal(React,
  {index: -1, page: null, paused: yes},
  setState: ({setState}, state) => setState state
)

timer = null
actions = {}
export default useFlipbook = (pages, useLoader) =>
  [{index, page, paused}, {setState}] = useIndex()
  [{isLoaded}] = useLoader()

  useLayoutEffect (=> setState index: 0 if isLoaded), [isLoaded]
  useLayoutEffect (=>
    clearTimeout timer
    if index < pages.length - 1 and index >= 0
      newPage = pages[index]
      setState page: newPage
      if paused
        setState page: {...newPage, duration: 0}
      else
        advanceIndex = => setState index: index + 1
        timer = setTimeout advanceIndex, newPage.duration
    => clearTimeout timer
  ), [index, paused]

  actions.pause = =>
    setState paused: Date.now()
  actions.play = =>
    setState paused: no
  actions.togglePlayPause = =>
    if paused then actions.play()
    else actions.pause()
  actions.advance = =>
    return if index >= pages.length - 1
    setState index: index + 1
    actions.play() if paused

  [page, index, actions]
