import React, {useState} from 'react'
import Backdrop from '../../components/Backdrop/it.coffee'
import Logo from '../../components/Logo/it.coffee'
import Friends from '../../components/Friends/it.coffee'
import Worlds from '../../components/Worlds/it.coffee'
import MailingList from '../../components/MailingList/it.coffee'
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
          <Backdrop />
          <Logo />
          <Worlds />
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
