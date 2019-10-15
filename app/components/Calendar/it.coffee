import React from 'react'

import {
  Root
} from './styled'
import {
  SectionHeader, Body
} from '../../global-styles'

export default class Calendar extends React.PureComponent

  render: =>
    <Root id='calendar'>
      <SectionHeader>calendar</SectionHeader>
      <Body>
        find a love explosion near you!
      </Body>

      <iframe src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23ffffff&amp;ctz=America%2FChicago&amp;src=Yjlka3VxdmlhNjdhZXNlNW85MnRmcGxjZjhAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23F09300&amp;showTitle=0&amp;showDate=1&amp;showPrint=0&amp;showCalendars=1&amp;showTz=1&amp;mode=MONTH" width="800" height="600" frameBorder="0" scrolling="no"></iframe>
    </Root>
