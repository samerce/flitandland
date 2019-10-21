import React, {useState} from 'react'
import GigglyNav from '../../components/GigglyNav/it.coffee'
import What from '../../components/What/it.coffee'
import Support from '../../components/Support/it.coffee'
import Calendar from '../../components/Calendar/it.coffee'
import TreasureChest from '../../components/TreasureChest/it.coffee'
import EymMethod from '../../components/EymMethod/it.coffee'
import Popup, {usePopup} from '../../components/Popup/it.coffee'
import BouncyPointer from '../../components/BouncyPointer/it.coffee'

import useScroller from '../../hooks/useScroller.coffee'
import {openInNewTab} from '../../utils/nav'

import GlobalStyle from '../../global-styles'
import {
  Root, Content, Icon,
} from './styled'

import {INSTAGRAM_URL} from '../../constants'

export default function App() {
  const [state] = usePopup()
  const {renderContent: popupVisible} = state

  const returnToTop = () => window.scroll({top: 0, behavior: 'smooth'})

  const [Scroller] = useScroller()
  Scroller.trigger('showReturnToTop', (scroll) => scroll >= window.innerHeight)
  const {showReturnToTop} = Scroller.triggers

  return (
      <Root>
        <GlobalStyle />
        <Content className={popupVisible && 'popupVisible'}>
          <GigglyNav />
          <What />
          <Support />
          <TreasureChest />
          <EymMethod />
        </Content>
        <Icon onClick={() => openInNewTab(INSTAGRAM_URL)} className='fab fa-instagram' />
        <BouncyPointer
          className={'returnToTop ' + (showReturnToTop && 'show')}
          onClick={returnToTop}
        />
        <Popup />
      </Root>
  )
}
