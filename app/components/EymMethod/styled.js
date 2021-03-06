import styled from 'styled-components'
import {
  theme, screen, Flex, H1
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #d75050 0%, #d71d1d 5%, #49b7bd 50%, #801dd7 100%);
  padding: 0 20px;
`

export const FAL = styled(H1)`
  font-size: 216%;
  font-family: just another hand;
  font-style: italic;
  margin: 54px auto;
`

export const Is = styled.div`
  font-size: 120%;
`

export const Method = styled.span`
  font-family: aladin;
`

export const EYM = styled(FAL)`
  text-decoration: underline;
  cursor: pointer;
`
