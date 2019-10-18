import React from 'react'
import useGlobal from 'use-global-hook'

state = renderContent: null
actions =
  show: ({setState}, renderContent) => setState {renderContent}
  hide: ({setState}) => setState renderContent: null

export default useGlobal(React, state, actions)
