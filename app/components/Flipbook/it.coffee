import React from 'react'
import Countdown from '../Countdown/it.coffee'

import l from './styled'
import * as c from '../../constants'
import {cx} from '../../utils/style'

import useFlipbook from './useFlipbook.coffee'
import useLoader from '../Bopz/useLoader.coffee'
import * as PagesMap from '../Bopz/Mangina.coffee'

Pages = Object.values(PagesMap)

export default Flipbook = =>
  [activePage, activeIndex, toggle, advance] = useFlipbook Pages, useLoader
  <l.Root>
    {if activePage?
      <Countdown duration={activePage.duration - 100} />
    else
      <l.Spinner />
    }
    {Pages.map (Page, i) =>
      mode = cx {
        hide: i < activeIndex
        show: i is activeIndex
        preload: i > activeIndex
      }
      <l.PageRoot className={mode}>
        <Page mode={mode} />
      </l.PageRoot>
    }
    <l.Fae>
      <l.Faerie onClick={toggle} className='waiting'>🧚🏽‍</l.Faerie>
      <l.Nails onClick={advance} className='waiting'>💅</l.Nails>
    </l.Fae>
  </l.Root>
