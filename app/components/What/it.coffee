import React from 'react'

import {
  Root, Commercial,
} from './styled'
import {
  SectionHeader, Body, Subheader, Button, Matrix, MatrixItem, MatrixItemIcon, MatrixItemText,
} from '../../global-styles'

WhyMatrixConfig

export default class What extends React.PureComponent

  render: =>
    <Root id='join'>
      <SectionHeader>{"what's"} this here thing?</SectionHeader>
      <Body>
        <i>flit & land</i> is a movement to end the scourge of soul-sucking 9-to-5 jobs and refocus our society on creating love & joy rather than tupperware & handbags! {"it's"} a method to express your mess in public, with humor, ecstasy, and joy in the lead.
      </Body>

      <Subheader>{"here's"} fizz to tell you more:</Subheader>
      <Commercial width="560" height="315" src="https://www.youtube.com/embed/C59QSCVpSuY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen />

      <Matrix>
        {WhyMatrixConfig.map (why) =>
          <MatrixItem id={why.icon}>
            <MatrixItemIcon className={why.icon} />
            <MatrixItemText>{why.text}</MatrixItemText>
          </MatrixItem>
        }
      </Matrix>

      <Button>start flittering today!</Button>
    </Root>


WhyMatrixConfig = [
  {
    icon: 'fas fa-money-bill-wave',
    text: 'get paid to spread joy!',
  },
  {
    icon: 'far fa-comments',
    text: 'create dialogue for democracy!',
  },
  {
    icon: 'far fa-lightbulb',
    text: 'bring your crazy ideas to life!',
  },
  {
    icon: 'fas fa-plane-departure',
    text: 'win a trip to a foreign land!',
  },
]
