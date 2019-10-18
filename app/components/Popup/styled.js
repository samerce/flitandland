import styled from 'styled-components'
import {darken, lighten, transparentize} from 'polished'
import {
  theme, Flex, AbsoluteFlexFillParent, FlexColumn
} from '../../global-styles'
import {
  EASE_OUT, EASE_OUT_SINE
} from '../../constants'

export const Root = styled(AbsoluteFlexFillParent)`
  text-align: center;
  justify-content: center;
  align-items: center;
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
    ${darken(.9, theme.shelly)} 100%
  );

  &, &.visible.hiding {
    opacity: 0;
    transition: all .5s ${EASE_OUT};
  }
  &.visible {
    opacity: 1;
    transition: all .5s ${EASE_OUT};
  }
`

export const PopupContent = styled(FlexColumn)`
  flex: 1 0 90%;
  padding: 30px;
  max-width: 820px;
  height: 104%;
  overflow-y: scroll;
  border-radius: 10px;
  border: 1px solid ${lighten(.2, '#9159dd')};
  box-shadow:
    ${theme.shadowVeryHeavy},
    -1px -1px 1px ${lighten(.4, '#9e626b')},
    -1px -1px 4px ${lighten(.5, '#9e626b')},
    -1px -1px 15px ${lighten(.6, '#9e626b')},
    1px 1px 1px ${lighten(.4, '#9159dd')},
    1px 1px 4px ${lighten(.5, '#9159dd')},
    1px 1px 15px ${lighten(.6, '#9159dd')};
  background: linear-gradient(115deg, #9e626b 0%, #425699 50%, #9159dd 100%);
  z-index: 1;

  &, &.visible.hiding {
    transform: translate(0, 200%);
    opacity: .5;
    transition: all .5s ${EASE_OUT};
  }
  &.visible {
    transform: translate(0, -1%);
    opacity: 1;
    transition: all .5s ${EASE_OUT};
    pointer-events: all;
  }
`
