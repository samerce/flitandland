import React, {useState, useEffect} from 'react'

import _usePopup from './usePopup.coffee'
import {cx} from '../../utils/style'
import {after} from '../../utils/lang'

import {
  Root, Backdrop, PopupContent
} from './styled'
import {
  SectionHeader, Body
} from '../../global-styles'

export usePopup = _usePopup
export default Popup = =>
  [state, actions] = usePopup()
  [visible, setVisible] = useState false
  [hiding, setHiding] = useState false

  {renderContent} = state
  onRenderContentChanged = =>
    if renderContent?
      console.log 'pol'
      setHiding false
      after 50, => setVisible true
    else
      console.log 'hi'
      setHiding true
      after 300, =>
        console.log 'bob'
        setVisible false
  useEffect onRenderContentChanged, [renderContent]

  cls = cx {active: renderContent?, visible, hiding}
  console.log cls
  <Root className={cls}>
    <Backdrop onClick={actions.hide} className={cls} />
    <PopupContent className={cls}>
      {renderContent() if renderContent?}
    </PopupContent>
  </Root>
