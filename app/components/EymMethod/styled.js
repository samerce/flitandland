import styled from 'styled-components'
import {
  theme, Flex, H1
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #d71d1d 0%, #49b7bd 50%, #801dd7 100%);
  padding: 0 20px;
`

export const FAL = styled(H1)`
  font-size: 108px;
  font-family: just another hand;
  font-style: italic;
`

export const Is = styled.div`
  font-size: 32px;
`

export const Method = styled.span`
  font-family: aladin;
`

export const EYM = styled(FAL)`
  text-decoration: underline;
  cursor: pointer;
`
