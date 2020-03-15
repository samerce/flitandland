import React, {useEffect} from 'react'
// import Chat from '../../components/Chat/it.coffee'
import SlackSteward from '../../components/SlackSteward/it.coffee'
import Curtain from '../../components/Curtain/it.coffee'
import Pay from '../../components/Checkout/it.coffee'
import BookCheckout from '../../components/BookCheckout/it.coffee'
import ContactUs from '../../components/ContactUs/it.coffee'
import * as PagesMap from '../../components/Bopz/Mangina.coffee'
const Pages = Object.values(PagesMap)
const PageKeys = Object.keys(PagesMap)

import GlobalStyle from '../../global-styles'
import * as l from './styled'
import * as c from '../../constants'
import * as g from '../../global-styles'

import 'intersection-observer'

// const whyDidYouRender = require('@welldone-software/why-did-you-render')
// whyDidYouRender(React)

export default function App() {
  useEffect(() => {
    window.onhashchange = runHashHandlers

    PageKeys.forEach((key) => {
      key = key.toLowerCase()
      cast('hashHandler.add', {
        trigger: '#' + key,
        onEnter: () => {
          const section = document.querySelector('#' + key)
          section.scrollIntoView({behavior: 'smooth'})
        },
        onChange: () => {},
        onExit: () => {},
      })
    })

    const {pathname} = window.location
    if (pathname && pathname.length > 1) {
      window.onload = () => {
        history.replaceState({}, document.title, '/')
        window.location.hash = '#' + pathname.substr(1)
        window.onload = null
      }
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

const hashHandlers = []
upon('hashHandler.add', (handler) => hashHandlers.push(handler))

let lastHash = ''
function runHashHandlers() {
    const {hash: currentHash} = window.location
    if (lastHash === currentHash) return

    let onEnter, onExit
    hashHandlers.forEach(handler => {
      const {trigger} = handler
      if (lastHash.match(trigger)) {
        if (currentHash.match(trigger)) {
          handler.onChange()
        } else {
          onExit = handler.onExit
        }
      } else if (currentHash.match(trigger)) {
        onEnter = handler.onEnter
      }
    })

    if (onExit) {
      onExit()
      if (onEnter) {
        setTimeout(onEnter, 250)
      }
    } else if (onEnter) onEnter()
    lastHash = currentHash
  }
