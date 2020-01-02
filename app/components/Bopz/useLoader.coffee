import React from 'react'
import useGlobal from 'use-global-hook'

export default useGlobal(React,
  {counter: 0, isLoaded: no},
  increment: ({setState, state}) =>
    newCounter = state.counter + 1
    setState counter: newCounter, isLoaded: newCounter >= 14
)
