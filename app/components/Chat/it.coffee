import React, {useState, useLayoutEffect} from 'react'
import FaeButton from '../FaeButton/it.coffee'

import l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'

export default Chat = =>
  [shouldShow, setShouldShow] = useState no
  showButtons = => setShouldShow yes
  hideButtons = => setShouldShow no
  initButtons = =>
    fbSubscribe = =>
      FB.Event.subscribe 'customerchat.dialogShow', showButtons
      FB.Event.subscribe 'customerchat.dialogHide', hideButtons
    window.addEventListener 'fbReady', fbSubscribe
    =>
      window.removeEventListener 'fbReady', fbSubscribe
      FB.Event.unsubscribe 'customerchat.dialogShow', showButtons
      FB.Event.unsubscribe 'customerchat.dialogHide', hideButtons
  useLayoutEffect initButtons, []
  <>
    <l.Style />
    <div
      className="fb-customerchat"
      page_id="1452817055016024"
      logged_in_greeting='hiya unicorn! do you believe in love?'
      logged_out_greeting='hiya unicorn! do you believe in love?'
      greeting_dialog_display='hide'
      theme_color={g.theme.susanDark}>
    </div>
    <l.Fae className={shouldShow and 'show'}>
      <FaeButton className='chat-button'>
        <l.Mail target='__blank'
          href={'mailto:whynot@expressyourmess.com?subject=owlchat'}>
          🐛
        </l.Mail>
      </FaeButton>
      <FaeButton className='chat-button'>
        <l.Insta href={c.InstagramUrl} target='__blank'>
          🐝
        </l.Insta>
      </FaeButton>
      <FaeButton className='chat-button'>
        <l.Twitter href={c.TwitterUrl} target='__blank'>
          🐒
        </l.Twitter>
      </FaeButton>
    </l.Fae>
  </>
