import React, {useEffect} from 'react'
// import Chat from '../../components/Chat/it.coffee'
import SlackSteward from '../../components/SlackSteward/it.coffee'
import Curtain from '../../components/Curtain/it.coffee'
import Pay from '../../components/Checkout/it.coffee'
import BookCheckout from '../../components/BookCheckout/it.coffee'
import ContactUs from '../../components/ContactUs/it.coffee'
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
  useEffect(() => {
    const {pathname} = location
    if (pathname && pathname.length > 1) {
      const id = pathname.substr(1)
      if (id === 'getbook') {
        after(2000, () => cast('book.openCheckout'))
        return
      }
      const section = document.querySelector('#' + id)
      if (section) section.scrollIntoView({behavior: 'smooth'})
      else history.replaceState({}, document.title, '/')
    }
  }, [])

  return (
    <l.Root id='scroll-root'>
      <GlobalStyle />
      <SlackSteward />
      <Curtain />
      {Pages.map((Page) => <Page />)}
      <BookCheckout />
      <Pay />
      <ContactUs />
    </l.Root>
  )
}
