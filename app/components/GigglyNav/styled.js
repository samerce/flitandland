import styled from 'styled-components'
import {lighten, darken} from 'polished'
import {
  theme, Flex, FlexColumn, AbsoluteFlexFillParent, H1, H2, AbsoluteFlex
} from '../../global-styles'
import {
  EASE_OUT
} from '../../constants'

export const Root = styled(Flex)`
  width: 100%;
  height: 100%;
  flex: 0 0 ${window.innerHeight}px;
  flex-wrap: wrap;
  cursor: pointer;
  position: relative;
`

const BorderColor = '#E8E68B'
const QuadBorder = `1px solid ${darken(.2, BorderColor)}`
export const Quad = styled(FlexColumn)`
  flex: 0 0 50%;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
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
  transition: all .3s ${EASE_OUT};

  ${Quad}:hover & {
    filter: none;
  }
`

export const QuadTitle = styled.div`
  font-size: 72px;
  z-index: 1;
  color: white;
  text-shadow: 1px 1px 5px black;
  font-family: just another hand;
  transition: all .3s ${EASE_OUT};

  ${Quad}:hover & {
    transform: scale(1.1);
  }
`

export const QuadSubtitle = styled.div`
  font-size: 28px;
  z-index: 1;
  color: white;
  text-shadow: 1px 1px 5px black;
  font-family: im fell dw pica;
`

export const CenterRoot = styled(AbsoluteFlexFillParent)`
  align-items: center;
  justify-content: center;
  z-index: 2;
  pointer-events: none;
`

export const Bubble = styled(Flex)`
  border-radius: 100%;
  width: ${p => p.size}px;
  height: ${p => p.size}px;
  flex: 0 0 ${p => p.size}px;
  justify-content: center;
  align-items: center;
  position: relative;
  box-shadow: ${theme.shadowVeryHeavy};
  cursor: pointer;
  transition: all .5s ${EASE_OUT};
  pointer-events: all;

  &.expanded {
    width: ${p => p.videoSize.width}px;
    height: ${p => p.videoSize.height}px;
    flex: 0 0 ${p => p.videoSize.height}px;
    border-radius: 10px;
  }
`

export const Logo = styled.div`
  font-size: 108px;
  font-family: just another hand;
  position: absolute;
  text-shadow: 2px 2px black, 1px 1px 20px black;
  transition: all .3s ${EASE_OUT};
  pointer-events: none;

  ${Bubble}:not(.expanded):hover & {
    transform: scale(1.1);
  }
  .expanded & {
    opacity: 0;
  }
`

export const VideoRoot = styled(Flex)`
  overflow: hidden;
  justify-content: center;
  align-items: center;
  flex: 0 0 ${p => p.size}px;
  height: ${p => p.size}px;
  border-radius: 100%;
  border: 2px solid ${BorderColor};
  transition: all .5s ${EASE_OUT};

  .expanded & {
    flex: 0 0 ${p => p.videoSize.width}px;
    height: ${p => p.videoSize.height}px;
    border-radius: 10px;
  }
`

export const BubbleVideo = styled.video`
  width: ${p => p.size.width}px;
  height: ${p => p.size.height}px;
`

export const LookDown = styled(AbsoluteFlex)`
  flex-direction: column;
  bottom: 30px;
  width: 100%;
  align-items: center;
  justify-content: center;
  pointer-events: none;

`

const IconColor = '#27b6e3'
const shwite = lighten(.1, IconColor)
export const Icon = styled.div`
  color: ${IconColor};
  font-weight: bold;
  text-shadow: 1px 1px 0 ${shwite}, 1px 1px 15px ${shwite};
  line-height: 18px;
  cursor: pointer;
  padding: 0 20px;
  pointer-events: all;

  @keyframes bounce {
    100% {
      transform: translate(0, 10px);
      text-shadow: 1px 1px 0 ${shwite}, 1px 1px 10px ${shwite};
    }
  }

  animation-name: bounce
  animation-duration: .5s;
  animation-iteration-count: infinite;
  animation-direction: alternate;

  &:nth-child(1) {
    font-size: 30px;
    line-height: 9px;
  }
  &:nth-child(2) {
    font-size: 40px;
    animation-delay: .1s;
  }
  &:nth-child(3) {
    font-size: 60px;
    animation-delay: .2s;
  }
`
