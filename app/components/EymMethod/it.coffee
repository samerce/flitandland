import React from 'react'

import {
  Root, FAL, Is, Method, EYM,
} from './styled'

import {openInNewTab} from '../../utils/nav'

export default EymMethod = =>
  <Root>
    <FAL>flit & land</FAL>
    <Is>is a&nbsp;<Method>method</Method>&nbsp;of</Is>
    <EYM onClick={() -> openInNewTab('https://expressyourmess.com')}>
      express your mess
    </EYM>
  </Root>
