import React, {useState, useLayoutEffect, useEffect} from 'react'
import useChat from '../../hooks/useChat.coffee'
import useLoader from '../Bopz/useLoader.coffee'
import useIntro from '../../hooks/useIntro.coffee'

export default useFlipbook = (pages) =>
  [index, setIndex] = useState -1
  [page, setPage] = useState {page: null}
  [paused, setPaused] = useState yes
  [actions] = useState {}
  [timer, setTimer] = useState {clear: =>}
  [{isLoaded}] = useLoader()
  [{isIntro}] = useIntro()
  {onChatOpen, onChatClose, closeChat, openChat, toggleChat} = useChat()

  actions.toggleChat = toggleChat
  actions.pause = => setPaused Date.now()
  actions.play = => setPaused no
  actions.togglePlayPause = =>
    if paused then actions.play()
    else actions.pause()
  actions.advance = =>
    return if index >= pages.length - 1
    closeChat()
    setIndex (i) => i + 1
    actions.play() if paused

  useEffect (=> setIndex 0 if isLoaded), [isLoaded]
  useEffect (=>
    return unless index < pages.length - 1 and index >= 0
    newPage = pages[index]
    if paused
      setPage page: {...newPage, duration: 0}
    else
      setPage page: newPage
      setTimer after newPage.duration, => setIndex (i) => i + 1
    => timer.clear()
  ), [index, paused]
  useEffect (=>
    onChatOpen =>
      if isIntro then closeChat()
      actions.pause()
    onChatClose => actions.play() unless isIntro
    undefined
  ), []
  useEffect (=> actions.play() unless isIntro), [isIntro]

  [page.page, index, isLoaded, isIntro, actions]
