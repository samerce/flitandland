import React from 'react'

import {
  LookDown, Icon,
} from './styled'

export default ({onClick, className}) =>
  <LookDown className={className}>
    <Icon className='fas fa-chevron-down' onClick={onClick} />
    <Icon className='fas fa-chevron-down' onClick={onClick} />
    <Icon className='fas fa-chevron-down' onClick={onClick} />
  </LookDown>
