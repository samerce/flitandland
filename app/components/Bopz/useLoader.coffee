import React, {useEffect} from 'react'
import useGlobal from 'use-global-hook'
import useBus from '../../hooks/useBus.coffee'

useLoader = useGlobal(React,
  {counter: 0, isLoaded: no},
  increment: ({setState, state}) =>
    newCounter = state.counter + 1
    setState counter: newCounter, isLoaded: newCounter >= 32
)

export default =>
  [{isLoaded}, {increment}] = useLoader()
  useBus
    'chat.loaded': increment
  [isLoaded, increment]
