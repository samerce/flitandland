import styled from 'styled-components'
import {lighten, darken} from 'polished'
import {
  theme, Flex, FlexColumn, AbsoluteFlexFillParent, H1, H2, AbsoluteFlex
} from '../../global-styles'
import {
  EASE_OUT
} from '../../constants'

export const LookDown = styled(AbsoluteFlex)`
  flex-direction: column;
  bottom: 30px;
  width: 100%;
  align-items: center;
  justify-content: center;
  pointer-events: none;
`

const IconColor = '#de069e'
const shwite = lighten(.1, IconColor)
export const Icon = styled.div`
  color: ${IconColor};
  font-weight: bold;
  text-shadow: 1px 1px 0 ${shwite}, 1px 1px 15px ${shwite};
  line-height: 18px;
  cursor: pointer;
  padding: 0 20px;
  pointer-events: all;
  transition: all .3s;

  @keyframes bounce {
    100% {
      transform: translate(0, 6px);
      text-shadow: 1px 1px 0 ${shwite}, 1px 1px 10px ${shwite};
    }
  }

  animation-name: bounce
  animation-duration: .5s;
  animation-iteration-count: infinite;
  animation-direction: alternate;

  ${LookDown}:hover & {
    color: ${lighten(.2, '#de069e')};
  }

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
