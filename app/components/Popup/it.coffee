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
      setHiding false
      after 50, => setVisible true
    else
      setHiding true
      after 300, => setVisible false
    return undefined
  useEffect onRenderContentChanged, [renderContent]

  cls = cx {active: renderContent?, visible, hiding}
  <Root className={cls}>
    <Backdrop onClick={actions.hide} className={cls} />
    <PopupContent className={cls}>
      {renderContent() if renderContent?}
    </PopupContent>
  </Root>
