import React, {useState} from 'react'
import Flipbook from '../../components/Flipbook/it.coffee'
import Chat from '../../components/Chat/it.coffee'
import Announcer from '../../components/Announcer/it.coffee'
import SlackSteward from '../../components/SlackSteward/it.coffee'
import Curtain from '../../components/Curtain/it.coffee'
import LandingPage from '../../components/LandingPage/it.coffee'

import GlobalStyle from '../../global-styles'
import * as l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'

// const whyDidYouRender = require('@welldone-software/why-did-you-render')
// whyDidYouRender(React)

export default function App() {
  // const [state] = usePopup()
  // const {renderContent: popupVisible} = state

  // const returnToTop = () => window.scroll({top: 0, behavior: 'smooth'})
  //
  // const [Scroller] = useScroller()
  // Scroller.trigger('showReturnToTop', (scroll) => scroll >= window.innerHeight)
  // const {showReturnToTop} = Scroller.triggers

  return (
      <l.Root>
        <SlackSteward />
        <GlobalStyle />
        <Curtain />
        <Announcer />
        <Flipbook />
        <LandingPage />
        <Chat />
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
      </l.Root>
  )
}
