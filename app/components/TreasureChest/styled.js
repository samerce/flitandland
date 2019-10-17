import styled from 'styled-components'
import {
  theme, Flex, AbsoluteFlex
} from '../../global-styles'
import {
  EASE_OUT_SINE
} from '../../constants'

const TabHeight = 50
const TabBorderRadius = 60

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #321dd7 0%, #c917ad 50%, #d71d1d 100%);
  justify-content: center;
  padding-left: 20px;
  padding-right: 20px;
`

export const Table = styled(Flex)`
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  border: 2px solid ${theme.main};
  border-radius: ${TabBorderRadius}px;
  max-width: 1280px;
  margin: 80px auto 0;
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
  background: radial-gradient(circle at center, #c917ad 0%, #d71d1d 50%, #641dd7 100%);
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
  transition: all .3s ${EASE_OUT_SINE};
  user-select: none;

  &.active {
    border-color: ${theme.main};
    background: ${theme.shelly};
    color: white;
  }
`

export const TableItem = styled(Flex)`
  flex: 0 0 33%;
  height: 200px;
  font-size: 48px;
  font-family: aladin;
  align-items: center;
  justify-content: center;
  padding: 10px;
  user-select: none;

  &.topBorders {
    border-top: 1px solid ${theme.main};
  }
  &.sideBorders {
    border-left: 1px solid ${theme.main};
    border-right: 1px solid ${theme.main};
  }
`
