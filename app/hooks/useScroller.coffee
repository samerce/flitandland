import React, {useState, useEffect} from 'react'

import {throttle} from 'lodash'

listeners = []
export default =>
  [triggers, setTriggers] = useState {}
  monitorScroll = =>
    scrollListener = (e) =>
      newTriggers = {}
      for listener in listeners
        newTriggers[listener.trigger] = listener(window.scrollY)
      setTriggers newTriggers

    throttled = throttle scrollListener, 200
    window.addEventListener 'scroll', throttled
    =>
      window.removeEventListener 'scroll', throttled
      listeners = []
  useEffect monitorScroll, []

  [{
    scrollIntoView: (idOrElement) =>
      if typeof idOrElement is string
        document.getElementById(idOrElement).scrollIntoView behavior: 'smooth'
      else idOrElement.scrollIntoView behavior: 'smooth'
    trigger: (trigger, test) =>
      test.trigger = trigger
      listeners.push(test)
    triggers
  }]
