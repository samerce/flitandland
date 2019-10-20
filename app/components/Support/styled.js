import styled from 'styled-components'
import {
  theme, Flex, MatrixItem as aMatrixItem, Body as _Body, MatrixImage as _MatrixImage, Subheader as _Subheader, canTilt, Matrix as _Matrix,
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
  align-items: center;
  background: linear-gradient(to bottom, #996fe8 0%, #7233e8 5%, #e02323 50%, #eb7e1a 95%, #eda461 100%);
`

export const Subheader = styled(_Subheader)`
  text-align: left;
  max-width: 800px;
  width: 90%;
  margin-top: 36px;

  &.bolois {
    text-align: right;
  }

  span {
    font-size: 120%;
    padding: 0 10px;
  }
`

export const PeopleImage = styled.img`
  margin: 60px auto;
  width: 50%;
  display: block;
`

export const Matrix = styled(_Matrix)`
  flex-direction: column;
`

export const MatrixItem = styled(aMatrixItem)`
  cursor: pointer;
  border: 1px dashed transparent;
  border-radius: 5px;
  flex: 0 0 auto;

  &:hover {
    border-color: ${theme.dali};
  }
  &:active {
    border-style: solid;
    background: ${theme.main};
  }
`

export const MatrixImageRoot = styled(Flex)`
  align-items: flex-end;
  position: relative;
  justify-content: center;
`

export const MatrixImage = styled(_MatrixImage)`
  max-width: 300px;
  border-radius: 100%;
`


export const Icon = styled.div`
  position: absolute;
  bottom: 10px;
  font-size: 32px;
  color: ${theme.shelly};
  opacity: .7;
  text-shadow: 1px 1px gray;
`

export const Body = styled(_Body)`
  text-align: center;
`
