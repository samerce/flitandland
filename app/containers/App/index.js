import React, {useState} from 'react'
import Backdrop from '../../components/Backdrop/it.coffee'
import Logo from '../../components/Logo/it.coffee'
import Friends from '../../components/Friends/it.coffee'
import Worlds from '../../components/Worlds/it.coffee'
import Pokerland from '../../components/Pokerland/it.coffee'
import Lampshadeland from '../../components/Lampshadeland/it.coffee'
import Eymuland from '../../components/Eymuland/it.coffee'
import NavCloseButton from '../../components/NavCloseButton/it.coffee'
import MailingList from '../../components/MailingList/it.coffee'
import Flipbook from '../../components/Flipbook/it.coffee'
import Popup, {usePopup} from '../../components/Popup/it.coffee'
import BouncyPointer from '../../components/BouncyPointer/it.coffee'

import useScroller from '../../hooks/useScroller.coffee'
import {openInNewTab} from '../../utils/nav'

import GlobalStyle from '../../global-styles'
import {
  Root, Content, Icon, Icons,
} from './styled'

import * as c from '../../constants'

export default function App() {
  const [state] = usePopup()
  const {renderContent: popupVisible} = state

  // const returnToTop = () => window.scroll({top: 0, behavior: 'smooth'})
  //
  // const [Scroller] = useScroller()
  // Scroller.trigger('showReturnToTop', (scroll) => scroll >= window.innerHeight)
  // const {showReturnToTop} = Scroller.triggers

  return (
      <Root>
        <GlobalStyle />
        <Flipbook />
        {/* <Content className={popupVisible && 'popupVisible'}>
          <Icons>
            <Icon
          onClick={() => openInNewTab(c.TWITTER_URL)}
          className='fab fa-twitter'
            />
            <Icon
          onClick={() => openInNewTab(c.MEDIUM_URL)}
          className='fab fa-medium-m'
            />
            <Icon
          onClick={() => openInNewTab(c.INSTAGRAM_URL)}
          className='fab fa-instagram'
            />
          </Icons>
          <Logo />
          <Worlds />
          <Eymuland />
          <Pokerland />
          <Lampshadeland />
          </Content>
          <NavCloseButton />
        <Popup /> */}
      </Root>
  )
}
