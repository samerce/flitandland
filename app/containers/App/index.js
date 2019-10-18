import React, {useState} from 'react'
import GigglyNav from '../../components/GigglyNav/it.coffee'
import What from '../../components/What/it.coffee'
import Support from '../../components/Support/it.coffee'
import Calendar from '../../components/Calendar/it.coffee'
import TreasureChest from '../../components/TreasureChest/it.coffee'
import EymMethod from '../../components/EymMethod/it.coffee'
import Popup, {usePopup} from '../../components/Popup/it.coffee'

import GlobalStyle from '../../global-styles'
import {
  Root, Content
} from './styled'

export default function App() {
  const [state] = usePopup()
  const {renderContent: popupVisible} = state
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
        <Popup />
      </Root>
  )
}
