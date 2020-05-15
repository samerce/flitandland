import React, {useEffect} from 'react'
import DuceLanding from '../../components/DuceLanding/it.coffee'

import GlobalStyle from '../../global-styles'
import * as l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'

import 'intersection-observer'

// const whyDidYouRender = require('@welldone-software/why-did-you-render')
// whyDidYouRender(React)

export default function App() {
  return (
    <l.Root id='scroll-root'>
      <GlobalStyle />
      <DuceLanding />
    </l.Root>
  )
}
