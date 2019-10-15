import styled from 'styled-components'
import {
  theme, Flex, MatrixItem as aMatrixItem
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
`

export const MatrixItem = styled(aMatrixItem)`
  flex: 0 0 33%;
`
