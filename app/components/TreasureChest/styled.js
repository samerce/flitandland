import styled from 'styled-components'
import {transparentize} from 'polished'
import {
  theme, Flex, AbsoluteFlex, Body as _Body
} from '../../global-styles'
import {
  EASE_OUT_SINE, EASE_OUT,
} from '../../constants'

const TabHeight = 50
const TabBorderRadius = 60

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #eda461 0%, #eb7e1a 5%, #c917ad 50%, #d71d1d 95%, #d75050 100%);
  justify-content: center;
  padding-left: 20px;
  padding-right: 20px;
`

export const Body = styled(_Body)`
  text-align: center;
`

export const Table = styled(Flex)`
  justify-content: center;
  border: 2px solid ${theme.main};
  border-radius: ${TabBorderRadius}px;
  max-width: 1280px;
  margin: 80px auto 40px;
  position: relative;
  background: linear-gradient(315deg, #020024 0%, #090979 35%, #00d4ff 100%);
  box-shadow: ${theme.shadowVeryHeavy};
`

export const TabBar = styled(AbsoluteFlex)`
  height: ${TabHeight}px;
  width: 70%;
  max-width: 780px;
  top: -${TabHeight / 2}px;
  border: 2px solid ${theme.main};
  border-radius: ${TabBorderRadius}px;
  background: radial-gradient(circle at center, #d65c5c 0%, #d71d1d 100%);
  cursor: pointer;
  padding: 2px;
`

export const TabItem = styled(Flex)`
  flex: 1;
  align-items: center;
  justify-content: center;
  font-family: aladin;
  font-size: 24px;
  border: 1px solid transparent;
  border-radius: ${TabBorderRadius}px;
  transition: all .3s ${EASE_OUT};
  user-select: none;
  color: ${transparentize(.2, 'white')};

  &.active {
    border-color: ${theme.main};
    background: #a10000;
    transform: scale(1.3);
    color: white;
    transition: all .5s ${EASE_OUT};
  }
`

export const TableItemsRoot = styled(Flex)`
  width: 100%;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  border-radius: ${TabBorderRadius}px;
  overflow: hidden;
`

export const TableItem = styled(Flex)`
  flex: 1 0 33%;
  height: 200px;
  font-size: 28px;
  font-family: aladin;
  align-items: center;
  justify-content: center;
  padding: 20px;
  user-select: none;
  transition: all .3s ${EASE_OUT};
  cursor: pointer;

  &:hover {
    background: ${transparentize(.7, theme.flikLight)};
  }

  &.topBorders {
    border-top: 1px solid ${theme.main};
  }
  &.sideBorders {
    border-left: 1px solid ${theme.main};
    border-right: 1px solid ${theme.main};
  }
`
