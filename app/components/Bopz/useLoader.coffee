import React, {useLayoutEffect} from 'react'
import useGlobal from 'use-global-hook'
import useChat from '../../hooks/useChat.coffee'

useLoader = useGlobal(React,
  {counter: 0, isLoaded: no},
  increment: ({setState, state}) =>
    newCounter = state.counter + 1
    setState counter: newCounter, isLoaded: newCounter >= 16
)

export default =>
  [s, {increment}] = useLoader()
  {onChatLoaded} = useChat()
  useLayoutEffect (=>
    onChatLoaded increment
    undefined
  ), []
  useLoader()
