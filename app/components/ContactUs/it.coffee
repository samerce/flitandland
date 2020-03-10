import React, {useState, useLayoutEffect} from 'react'
import Sheet from '../Sheet/it.coffee'

import l from './styled'
import {cx} from '../../utils/style'

import useBus from '../../hooks/useBus.coffee'

OpenCast = 'contactus.open'
CloseCast = 'contactus.close'
export default ContactUs = (p) =>
  [mode, setMode] = useState 'idle'
  [email, setEmail] = useState()
  [msg, setMsg] = useState()

  onChangeEmail = ({target}) =>
    setEmail target.value?.trim()
  onChangeMsg = ({target}) =>
    setMsg target.value
  sendMsg = =>
    if not email?.length then return alert 'please enter your email'
    if not msg?.trim().length then return alert 'please enter a message'
    setMode 'sending'
    cast 'PostToSlack', {
      msg: "🤩 new message! 🍄\nfrom: #{email}\n#{msg}"
      channel: 'barter'
    }

  useBus
    PostToSlackDone: =>
      setMode 'sent'
      after 1500, => cast CloseCast
      after 1800, =>
        setEmail null
        setMsg null
        setMode 'idle'
    PostToSlackFailed: =>
      setMode 'failed'
      alert 'try again or email us at whynot@expressyourmess.com'

  <Sheet openCast={OpenCast} closeCast={CloseCast} className='contactUsSheet'>
    <l.GlobalStyle />
    <l.Title>let’s talk!</l.Title>
    <l.Subtitle>
      i want this book in your hands, let’s barter and make it happen!
    </l.Subtitle>
    <l.Email value={email} onChange={onChangeEmail} placeholder='email' />
    <l.Message value={msg} onChange={onChangeMsg} placeholder='what you got? :)' />
    <l.Send onClick={sendMsg} className={cx [mode]: yes}>
      {switch mode
        when 'idle' then 'send'
        when 'sending' then 'sending...'
        when 'sent' then 'message sent!'
        when 'failed' then 'send failed :('
      }
    </l.Send>
  </Sheet>
