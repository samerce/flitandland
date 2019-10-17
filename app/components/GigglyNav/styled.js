import styled from 'styled-components'
import {
  theme, Flex, AbsoluteFlexFillParent, H1, H2
} from '../../global-styles'

export const Root = styled(Flex)`
  width: 100%;
  height: 100%;
  flex: 0 0 ${window.innerHeight}px;
  flex-wrap: wrap;
  position: relative;
`

const QuadBorder = `1px solid ${theme.main}`
export const Quad = styled.a`
  display: flex;
  flex: 0 0 50%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  cursor: pointer;
  pointer-events: all;

  &.topLeft {
    border-right: ${QuadBorder};
    border-bottom: ${QuadBorder};
  }
  &.topRight {
    border-left: ${QuadBorder};
    border-bottom: ${QuadBorder};
  }
  &.bottomLeft {
    border-top: ${QuadBorder};
    border-right: ${QuadBorder};
  }
  &.bottomRight {
    border-top: ${QuadBorder};
    border-left: ${QuadBorder};
  }
`

export const QuadImage = styled.div`
  background: url("${p => p.src}");
  background-size: cover;
  position: absolute;
  height: 100%;
  width: 100%;
  filter: brightness(.6);
  pointer-events: none;

  &:hover {
    filter: none;
  }
`

export const QuadTitle = styled.div`
  font-size: 72px;
  z-index: 1;
  color: white;
  text-shadow: 1px 1px 5px black;
  font-family: just another hand;
`

export const QuadSubtitle = styled.div`
  font-size: 28px;
  z-index: 1;
  color: white;
  text-shadow: 1px 1px 5px black;
  font-family: "goudy bookletter 1911";
`

export const CenterRoot = styled(AbsoluteFlexFillParent)`
  align-items: center;
  justify-content: center;
`

const getSize = screenWidth => Math.min(window.innerWidth, 400);
export const Bubble = styled(Flex)`
  border-radius: 100%;
  border: 2px solid ${theme.main};
  height: ${getSize(window.innerWidth)}px;
  width: ${getSize(window.innerWidth)}px;
  flex: 0 0 ${getSize(window.innerWidth)}px;
  overflow: hidden;
  justify-content: center;
  align-items: center;
`

export const BubbleVideo = styled.video``
