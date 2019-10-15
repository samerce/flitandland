import React from 'react'

import {
  Root, MatrixItem,
} from './styled'
import {
  SectionHeader, Body, Matrix, MatrixItemIcon, MatrixItemText,
} from '../../global-styles'

SupportMatrixConfig

export default class Support extends React.PureComponent

  render: =>
    <Root id='support'>
      <SectionHeader>support love</SectionHeader>
      <Body>
        got some resources to share?
      </Body>

      <Matrix>
        {SupportMatrixConfig.map (support) ->
          <MatrixItem>
            <MatrixItemIcon className={support.icon} />
            <MatrixItemText>{support.text}</MatrixItemText>
          </MatrixItem>
        }
      </Matrix>
    </Root>

SupportMatrixConfig = [
  {
    icon: 'fas fa-donate',
    text: 'donate dollars',
  },
  {
    icon: 'fas fa-hotel',
    text: 'donate space',
  },
  {
    icon: 'fas fa-paint-brush',
    text: 'donate materials',
  },
  {
    icon: 'fas fa-dice',
    text: 'sponsor a lottery',
  },
  {
    icon: 'fas fa-lightbulb',
    text: 'submit ideas',
  },
]
