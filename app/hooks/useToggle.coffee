import React, {useState} from 'react'

export default (init, yesCast, noCast) =>
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
      if val then yesCast
      else noCast
  [thing, toggle, manualSet]
