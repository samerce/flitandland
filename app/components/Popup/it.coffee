import React, {useState, useLayoutEffect} from 'react'

import _usePopup from './usePopup.coffee'
import {cx} from '../../utils/style'
import {after} from '../../utils/lang'

import {
  Root, Backdrop, PopupContent
} from './styled'

timer = null

export usePopup = _usePopup
export default Popup = =>
  [state, actions] = usePopup()
  [visible, setVisible] = useState no
  [hiding, setHiding] = useState no

  {renderContent} = state
  onRenderContentChanged = =>
    timer.clear() if timer?
    if renderContent?
      setHiding false
      timer = after 50, => setVisible true
    else
      setHiding true
      timer = after 300, => setVisible false
    return undefined
  useLayoutEffect onRenderContentChanged, [renderContent]

  cls = cx {active: renderContent?, visible, hiding}
  <Root className={cls}>
    <Backdrop onClick={actions.hide} className={cls} />
    <PopupContent className={cls}>
      {renderContent() if renderContent?}
    </PopupContent>
  </Root>
