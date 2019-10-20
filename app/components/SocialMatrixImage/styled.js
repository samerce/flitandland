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
  max-width: 50%;
  margin: 0 10px;
  transition: all .3s;

  ${p => p.tilt && `
    transform: rotate(${p.tilt}deg);
  `}
  ${screen.medium`
    max-width: 100%;
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
`

export const Icon = styled.div`
  flex: 0 0 30px;
  cursor: pointer;
`

export const LikeCount = styled(Flex)`
  flex: 1;
  font-family: aladin;
`

export const Image = styled(MatrixImage)`
  max-width: 100%;
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
