import React from 'react'

import {
  Root, FAL, Is, Method, EYM,
} from './styled'
import {
  SectionHeader, Body
} from '../../global-styles'

import {openInNewTab} from '../../utils/nav'

export default class EymMethod extends React.PureComponent

  render: =>
    <Root>
      <FAL>flit & land</FAL>
      <Is>is a&nbsp;<Method>method</Method>&nbsp;of</Is>
      <EYM onClick={@onClickEym}>express your mess</EYM>
    </Root>

  onClickEym: => openInNewTab('https://expressyourmess.com')
