import React, {useState, useLayoutEffect, useEffect} from 'react'
import useChat from '../../hooks/useChat.coffee'
import useLoader from '../Bopz/useLoader.coffee'

DefaultPage = {duration: 0}
PausePage = DefaultPage
export default useFlipbook = (pages) =>
  [index, setIndex] = useState 0
  [page, setPage] = useState {page: DefaultPage}
  [paused, setPaused] = useState yes
  [solIsOpen, setSolIsOpen] = useState no
  [actions] = useState {}
  [timer, setTimer] = useState {clear: =>}
  [{isLoaded}] = useLoader()
  {onChatOpen, onChatClose, closeChat, openChat, toggleChat} = useChat()

  actions.toggleChat = toggleChat
  actions.pause = =>
    setPaused Date.now()
    dispatch 'fal.flipbook.paused'
  actions.play = =>
    dispatch 'fal.announcer.hide' if index is 0
    setPaused no
    dispatch 'fal.flipbook.playing'
  actions.togglePlayPause = =>
    if paused then actions.play()
    else actions.pause()
  actions.advance = =>
    return if index >= pages.length - 1
    closeChat()
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
      setTimer after newPage.duration, => setIndex (i) => i + 1
    => timer.clear()
  ), [index, paused]
  useLayoutEffect (=>
    listen 'fal.flipbook.solWasClicked', =>
      if solIsOpen
        setSolIsOpen no
        closeChat()
        actions.play()
      else
        setSolIsOpen yes
        actions.pause()
  ), [solIsOpen]

  [page.page, index, isLoaded, solIsOpen, actions]
