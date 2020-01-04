import React, {useLayoutEffect} from 'react'
import useGlobal from 'use-global-hook'
import {throttle} from 'lodash'

state = isOpen: no, isLoaded: no
actions =
  setIsOpen: ({setState}, isOpen) => setState {isOpen: isOpen}
  setIsLoaded: ({setState}, isLoaded) => setState {isLoaded}

useChatState = useGlobal(React, state, actions)

ChatShow = 'customerchat.dialogShow'
ChatHide = 'customerchat.dialogHide'
ChatLoad = 'customerchat.show'

subscribers =
  [ChatShow]: []
  [ChatHide]: []
  [ChatLoad]: []
openChat = => FB.CustomerChat.showDialog() if FB
closeChat = => FB.CustomerChat.hideDialog() if FB
onChatOpen = (cb) => subscribers[ChatShow].push cb
onChatClose = (cb) => subscribers[ChatHide].push cb
onChatLoaded = (cb) => subscribers[ChatLoad].push cb

window.addEventListener 'fbReady', =>
  FB.Event.subscribe ChatShow, => cb() for cb in subscribers[ChatShow]
  FB.Event.subscribe ChatHide, => cb() for cb in subscribers[ChatHide]
  FB.Event.subscribe ChatLoad, => cb() for cb in subscribers[ChatLoad]

export default useChat = =>
  {onChatOpen, onChatClose, onChatLoaded, closeChat, openChat}
