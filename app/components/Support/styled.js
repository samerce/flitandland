import styled from 'styled-components'
import {
  theme, Flex, MatrixItem as aMatrixItem
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #7233e8 0%, #e02323 50%, #eb7e1a 100%);
`

export const MatrixItem = styled(aMatrixItem)`
  flex: 1 0 33%;
`
