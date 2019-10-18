import styled from 'styled-components'
import {
  theme, Flex, MatrixItem as aMatrixItem, Body as _Body,
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #996fe8 0%, #7233e8 5%, #e02323 50%, #eb7e1a 95%, #eda461 100%);
`

export const PeopleImage = styled.img`
  margin: 60px auto;
  width: 50%;
  display: block;
`

export const MatrixItem = styled(aMatrixItem)`
  cursor: pointer;
  border: 1px dashed transparent;
  border-radius: 5px;

  &:hover {
    border-color: ${theme.dali};
  }
  &:active {
    border-style: solid;
    background: ${theme.main};
  }
`

export const Body = styled(_Body)`
  text-align: center;
`
