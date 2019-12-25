import styled from 'styled-components'
import {lighten, darken, transparentize} from 'polished'
import {
  theme, screen, Flex, FlexColumn, AbsoluteFlexFillParent, H1, H2, AbsoluteFlex
} from '../../global-styles'
import {
  EASE_OUT
} from '../../constants'

export const Root = styled(Flex)`
  width: 100%;
  height: 100%;
  flex: 0 0 ${p => p.screenHeight}px;
  flex-wrap: wrap;
  cursor: pointer;
  position: relative;
`

const AccentColor = '#de069e'
const BorderColor = transparentize(.5, AccentColor)
const QuadBorder = `1px solid ${BorderColor}`
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
  background-position: center;
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
  z-index: 1;
  color: white;
  text-shadow: 1px 1px 5px black;
  font-family: just another hand;
  transition: all .3s ${EASE_OUT};
  font-size: 400%;
  line-height: 110%;
  text-align: center;
  padding: 0 5px;

  ${Quad}:hover & {
    transform: scale(1.1);
  }
  ${screen.medium`
    font-size: 300%;
  `}
  ${screen.medium`
    font-size: 250%;
  `}
`

export const QuadSubtitle = styled.div`
  font-size: 120%;
  line-height: 110%;
  z-index: 1;
  color: white;
  text-shadow: 1px 1px 5px black;
  font-family: im fell dw pica;
  text-align: center;
  padding: 0 5px;
`

export const CenterRoot = styled(AbsoluteFlexFillParent)`
  align-items: center;
  justify-content: center;
  z-index: 2;
  pointer-events: none;
  transition: all .3s;
  background: radial-gradient(circle at center, transparent 0%, transparent 100%);

  &.expanded {
    pointer-events: all;
    background: radial-gradient(circle at center, transparent 0%, black 100%);
  }
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

  .expanded & {
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
  text-shadow: 0 0 2px white,
    0 0 3px ${lighten(.2, AccentColor)},
    1px 1px 5px ${lighten(.3, AccentColor)},
    1px 1px 10px ${lighten(.5, AccentColor)};
  transition: all .6s;
  pointer-events: none;
  z-index: 2;
  color: white;

  ${screen.large`
    font-size: 350%;
  `}
  ${screen.small`
    font-size: 300%;
  `}

  ${Bubble}:not(.expanded):hover & {
    transform: scale(1.1);
    transition-duration: .3s;
  }
  .expanded & {
    opacity: 0;
    transition-duration: .3s;
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
  transition: all .5s;
  position: relative;

  .expanded & {
    flex: 0 0 ${p => p.videoSize.width}px;
    height: ${p => p.videoSize.height}px;
    border-radius: 10px;
  }
`

export const BubbleVideo = styled.video`
  width: ${p => p.size.width}px;
  height: ${p => p.size.height}px;
  position: absolute;
  margin: 60px 0 0 220px;
  transition: all .5s;

  ${screen.xlarge`
    margin-left: 210px;
  `}
  ${screen.large`
    margin: 40px 0 0 150px;
  `}
  ${screen.medium`
    margin: 0 0 0 70px;
  `}

  .expanded & {
    margin: 0;
  }
`
