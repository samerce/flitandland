import React, {useState, useLayoutEffect} from 'react'

import * as PagesMap from '../Bopz/Mangina.coffee'
Pages = Object.values(PagesMap)

import useBus from '../../hooks/useBus.coffee'

import l from './styled'
import * as c from '../../constants'
import {cx} from '../../utils/style'

export default LandingPage = =>
  [visible, setVisible] = useState no
  useBus
    'flipbook.closed': => setVisible yes
  <l.Root className={cx {visible}}>
    {Pages.map (Page) =>
      <l.PageRoot><Page mode='show' /></l.PageRoot>
    }
  </l.Root>
