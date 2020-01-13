import React, {useState, useLayoutEffect} from 'react'
import FaeButton from '../FaeButton/it.coffee'

import l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'
import {cx} from '../../utils/style'

import useChat from '../../hooks/useChat.coffee'
import useBus from '../../hooks/useBus.coffee'

Greeting = 'hiya unicorn! do you believe in love?'

export default Chat = =>
  [isChatOpen, setIsChatOpen] = useState no
  useBus
    'chat.opened': => setIsChatOpen yes
    'chat.closed': => setIsChatOpen no

  <>
    <l.Style />
    <div
      className='fb-customerchat'
      page_id='1452817055016024'
      logged_in_greeting={Greeting}
      logged_out_greeting={Greeting}
      greeting_dialog_display='hide'
      theme_color={g.theme.susanDark}>
    </div>
    <l.Fae className={cx show: isChatOpen}>
      <FaeButton className='chat-button'>
        <l.Mail target='__blank'
          href={'mailto:whynot@expressyourmess.com?subject=owlchat'}>
          🐛
        </l.Mail>
        <l.ButtonTitle>
          email
        </l.ButtonTitle>
      </FaeButton>
      <FaeButton className='chat-button insta'>
        <l.Insta href={c.InstagramUrl} target='__blank'>
          🐝
        </l.Insta>
        <l.ButtonTitle>
          insta
        </l.ButtonTitle>
      </FaeButton>
      <FaeButton className='chat-button twitter'>
        <l.Twitter href={c.TwitterUrl} target='__blank'>
          🐒
        </l.Twitter>
        <l.ButtonTitle>
          tweet
        </l.ButtonTitle>
      </FaeButton>
    </l.Fae>
  </>
