import React, {useState} from 'react'
import useBus from './useBus.coffee'

export default (init, yesCast, noCast, yesEvent = '', noEvent = '') =>
  [thing, setit] = useState init

  toggle = =>
    if thing
      setit no
      cast noCast if noCast
    else
      setit yes
      cast yesCast if yesCast

  manualSet = (val, castit = yes) =>
    setit val
    if castit
      if val then cast yesCast if yesCast
      else cast noCast if noCast

  useBus
    [yesEvent]: => manualSet yes
    [noEvent]: => manualSet no

  [thing, toggle, manualSet]
