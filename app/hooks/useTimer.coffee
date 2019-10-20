import React, {useState} from 'react'

export default =>
  [timer, setTimer] = useState null
  after = (time, fn) =>
    clearTimeout timer if timer
    setTimer setTimeout fn, time
  {
    after,
    clearTimer: => clearTimeout timer
  }
