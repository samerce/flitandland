import React from 'react'
import GigglyNav from '../../components/GigglyNav/it.coffee'
import What from '../../components/What/it.coffee'
import Support from '../../components/Support/it.coffee'
import Calendar from '../../components/Calendar/it.coffee'
import TreasureChest from '../../components/TreasureChest/it.coffee'
import EymMethod from '../../components/EymMethod/it.coffee'

import GlobalStyle from '../../global-styles'
import { Root } from './styled'

export default function App() {
  return (
    <Root>
      <GlobalStyle />
      <GigglyNav />
      <What />
      <Support />
      <Calendar />
      <TreasureChest />
      <EymMethod />
    </Root>
  )
}
