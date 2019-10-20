import styled from 'styled-components'
import {darken, lighten, transparentize} from 'polished'
import {
  theme, screen, Flex, AbsoluteFlexFillParent, FlexColumn, Button,
} from '../../global-styles'
import {
  EASE_OUT, EASE_OUT_SINE
} from '../../constants'

export const Root = styled(AbsoluteFlexFillParent)`
  text-align: center;
  justify-content: center;
  align-items: flex-start;
  display: none;
  position: fixed;

  &, &.visible.hiding {
    pointer-events: none;
  }
  &.active, &.visible {
    display: flex;
    pointer-events: all;
  }
`

export const Backdrop = styled(AbsoluteFlexFillParent)`
  background: radial-gradient(circle at center,
    transparent 0%,
    ${darken(.5, theme.shelly)} 100%
  );

  &, &.visible.hiding {
    opacity: 0;
    transition: all .5s;
  }
  &.visible {
    opacity: 1;
    transition: all .4s;
  }
`

export const PopupContent = styled(FlexColumn)`
  flex: 1;
  margin: 0 5px;
  padding: 0 30px 10px;
  max-width: 820px;
  height: 101%;
  overflow-y: scroll;
  border-radius: 5px;
  border: 1px solid ${transparentize(.5, '#9159dd')};
  box-shadow:
    ${theme.shadowVeryHeavy},
    -1px -1px 1px ${lighten(.4, '#9e626b')},
    1px 1px 1px ${lighten(.4, '#9159dd')};
  background: linear-gradient(115deg, #9e626b 0%, #425699 50%, #9159dd 100%);
  z-index: 1;

  &, &.visible.hiding {
    transform: translate3d(0, 150%, 0);
    transition: all .5s;
  }
  &.visible {
    transform: translate3d(0, 5px, 0);
    transition: all .4s;
    pointer-events: all;
  }
`

export const BackButton = styled(Button)`
  position: fixed;
  bottom: 10px;
  width: 100%;
  height: 60px;
  z-index: 1;
  background: #9e626b;
  align-items: center;
  display: none;
  transition: all .3s;

  ${screen.medium`
    display: flex;
  `}
  &, &.visible.hiding {
    transform: scale(1.1);
    opacity: 0;
  }
  &.visible {
    transform: none;
    opacity: 1;
    transition-delay: .2s;
  }
`
