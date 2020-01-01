import React, {useState, useLayoutEffect} from 'react'
import Countdown from '../Countdown/it.coffee'

import l from './styled'
import * as c from '../../constants'

import Pages from './pages'

export default Flipbook = =>
  [index, setIndex] = useState 0
  page = Pages[index]

  useLayoutEffect =>
    if index < Pages.length - 1
      advancePage = => setIndex (oldIndex) => oldIndex + 1
      timer = setTimeout advancePage, page.duration
    => clearTimeout timer

  <l.Root>
    <Countdown duration={page.duration - 100} />
    {page.render()}
  </l.Root>
