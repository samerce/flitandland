import React, {useEffect} from 'react'
import Countdown from '../Countdown/it.coffee'
import FaeButton from '../FaeButton/it.coffee'

import l from './styled'
import * as c from '../../constants'
import {cx} from '../../utils/style'

import useFlipbook from './useFlipbook.coffee'
import useLoader from '../Bopz/useLoader.coffee'
import * as PagesMap from '../Bopz/Mangina.coffee'

Pages = Object.values(PagesMap)


export default Flipbook = =>
  [activePage, activeIndex, toggle, advance] = useFlipbook Pages, useLoader
  [{isLoaded}, {increment}] = useLoader()
  window.addEventListener 'fbReady', =>
    FB.Event.subscribe 'customerchat.show', =>
      FB.CustomerChat.hide()
      increment()

  <l.Root>
    {if isLoaded
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
    <FaeButton className='flipbook-button tinkerbell'>
      <l.Tinkerbell onClick={toggle}>🧚🏽‍</l.Tinkerbell>
    </FaeButton>
    <FaeButton className='flipbook-button nails'>
      <l.Nails onClick={advance}>💅</l.Nails>
    </FaeButton>
  </l.Root>
