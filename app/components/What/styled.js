import styled from 'styled-components'
import {transparentize} from 'polished'
import {
  theme, Flex, MatrixItem as aMatrixItem, Button as aButton, MatrixImage as _MatrixImage,
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #27b6e3 0%, #25e27c 50%, #7233e8 95%, #996fe8 100%);
`

export const Commercial = styled.iframe`
  border-radius: 20px;
  border: 1px solid white;
  box-shadow: ${theme.shadowVeryHeavy};
  margin: 20px auto 0;
  width: ${p => p.size.width}px;
  height: ${p => p.size.height}px;
`

export const PeopleImage = styled.img`
  margin: 60px auto;
  width: 50%;
  display: block;
`

export const MatrixImage = styled(_MatrixImage)`

`

export const Button = styled(aButton)`
  margin: 40px auto 0;
`
