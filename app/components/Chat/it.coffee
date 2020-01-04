import React, {useState, useLayoutEffect} from 'react'
import FaeButton from '../FaeButton/it.coffee'

import l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'
import {cx} from '../../utils/style'

import useChat from '../../hooks/useChat.coffee'
import useIntro from '../../hooks/useIntro.coffee'

export default Chat = =>
  [isChatOpen, setIsChatOpen] = useState no
  {onChatOpen, onChatClose, closeChat} = useChat()
  [{isIntro}] = useIntro()

  useLayoutEffect (=>
    onChatOpen => setIsChatOpen yes
    onChatClose => setIsChatOpen no
    undefined
  ), []

  init = =>
    window.addEventListener 'fbReady', =>
      closeChat()
      fbChat = document.getElementById('fb-root')
      fbChat.classList.add 'intro'
  useLayoutEffect init, []

  onExitIntro = =>
    return if isIntro
    fbChat = document.getElementById('fb-root')
    fbChat.classList.remove 'intro'
    fbChat.classList.add 'waiting'
  useLayoutEffect onExitIntro, [isIntro]

  <>
    <l.Style />
    <div
      className='fb-customerchat'
      page_id='1452817055016024'
      logged_in_greeting='hiya unicorn! do you believe in love?'
      logged_out_greeting='hiya unicorn! do you believe in love?'
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
