import React from 'react'
import useGlobal from 'use-global-hook'

state = view: null
actions =
  show: ({setState}, view) => setState {view}
  hide: ({setState}) => setState view: null

export default useGlobal(React, state, actions)
