import React from 'react'
import Chat from '../../components/Chat/it.coffee'
// import SlackSteward from '../../components/SlackSteward/it.coffee'
// import Curtain from '../../components/Curtain/it.coffee'
import QuickHit from '../../components/QuickHit/it.coffee'
import * as PagesMap from '../../components/Bopz/Mangina.coffee'
const Pages = Object.values(PagesMap)

import GlobalStyle from '../../global-styles'
import * as l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'

import 'intersection-observer'

// const whyDidYouRender = require('@welldone-software/why-did-you-render')
// whyDidYouRender(React)

export default function App() {
  return (
      <l.Root>
        {/* <SlackSteward /> */}
        <GlobalStyle />
        {/* <Curtain /> */}
        <Chat />
        <QuickHit />
        {Pages.map((Page) => <Page />)}
      </l.Root>
  )
}
