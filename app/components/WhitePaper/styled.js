import styled from 'styled-components'
import {
  theme, FlexColumn, Subheader as _Subheader
} from '../../global-styles'

export const Root = styled(FlexColumn)`
  padding: 0 0 80px;
`

export const Subheader = styled(_Subheader)`
  font-size: 120%;
  line-height: 110%;
  margin: 0 0 80px;
`
