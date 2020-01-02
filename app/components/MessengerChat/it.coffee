import React from 'react'

import l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'

export default MessengerChat = =>
  <>
    <l.Style />
    <div
      className="fb-customerchat"
      page_id="1452817055016024"
      greeting_dialog_display='fade'
      logged_in_greeting='hiya unicorn! do you believe in love?'
      logged_out_greeting='hiya unicorn! do you believe in love?'
      theme_color={g.theme.susanDark}>
    </div>
  </>
