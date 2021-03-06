import React, {useLayoutEffect} from 'react'
import useGlobal from 'use-global-hook'
import {throttle} from 'lodash'

ChatShow = 'customerchat.dialogShow'
ChatHide = 'customerchat.dialogHide'
ChatLoad = 'customerchat.show'

isChatOpen = no
isChatLoaded = no
subscribers =
  [ChatShow]: []
  [ChatHide]: []
  [ChatLoad]: []
openChat = => if FB then FB.CustomerChat.showDialog()
closeChat = => if FB then FB.CustomerChat.hideDialog()
toggleChat = =>
  return unless FB
  if isChatOpen then closeChat()
  else openChat()
onChatOpen = (cb) => subscribers[ChatShow].push cb
onChatClose = (cb) => subscribers[ChatHide].push cb
onChatLoaded = (cb) => subscribers[ChatLoad].push cb

upon 'chat.close', closeChat
upon 'chat.open', openChat
upon 'chat.toggle', toggleChat
upon 'fb.ready', =>
  FB.Event.subscribe ChatShow, =>
    isChatOpen = yes
    cast 'chat.opened'
    cb() for cb in subscribers[ChatShow]
  FB.Event.subscribe ChatHide, =>
    isChatOpen = no
    cast 'chat.closed'
    cb() for cb in subscribers[ChatHide]
  FB.Event.subscribe ChatLoad, =>
    isChatLoaded = yes
    cast 'chat.loaded'
    cb() for cb in subscribers[ChatLoad]

export default useChat = =>
  {onChatOpen, onChatClose, onChatLoaded, closeChat, openChat, toggleChat}
