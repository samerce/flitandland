import React from 'react'
import useGlobal from 'use-global-hook'

state = isIntro: yes
actions =
  setIsIntro: ({setState}, isIntro) => setState {isIntro}

export default useGlobal(React, state, actions)
