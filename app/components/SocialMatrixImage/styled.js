import styled from 'styled-components'
import {transparentize} from 'polished'
import {
  theme, screen, Flex, AbsoluteFlex, Body as _Body, MatrixImage, AbsoluteFlexFillParent
} from '../../global-styles'
import {
  EASE_OUT_SINE, EASE_OUT,
} from '../../constants'

export const Root = styled(Flex)`
  position: relative;
  margin: 0 10px;
  transition: all .3s;

  ${p => p.tilt && `
    transform: rotate(${p.tilt}deg);
  `}
  ${screen.large`
    width: 50%;
  `}
  ${screen.medium`
    width: 90%;
  `}
`

export const SocialFunBar = styled(AbsoluteFlex)`
  bottom: 0;
  height: 60px;
  font-size: 26px;
  align-items: center;
  justify-content: center;
  width: 100%;
  color: ${theme.shelly};
  padding: 0 30px;

  ${screen.mediumlarge`
    font-size: 22px;
  `}
  ${screen.medsmall`
    font-size: 18px;
  `}
  ${screen.small`
    font-size: 16px;
  `}
`

export const Icon = styled.div`
  flex: 0 1 30px;
  cursor: pointer;

  ${screen.small`
    flex: 0 0 20px;
  `}
`

export const LikeCount = styled(Flex)`
  flex: 1;
  font-family: aladin;
`

export const Image = styled(MatrixImage)`
  height: 85%;
  max-width: initial;

  ${screen.large`
    height: initial;
    max-width: 100%;
    width: 100%;
  `}
`

export const EmojiGanja = styled(AbsoluteFlexFillParent)`
  font-size: 108px;
  pointer-events: none;
  z-index: 1;
  display: none;
  justify-content: center;
  text-shadow: ${theme.shadowVeryHeavy};
  user-select: none;

  &.show {
    display: flex;
  }
`
