import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  width: 100%;
  height: 100%;
  overflow: hidden;
  position: relative;
`

l.PageRoot = styled(g.AbsoluteFlex)`
  width: 100%;
  height: 100%;
  overflow: hidden;

  &.hide {
    display: none;
  }
  &.preload {
    visibility: hidden;
    pointer-events: none;
  }
`

l.Spinner = styled(g.AbsoluteFlex)`
  width: 100%;
  height: 100%;
  background: inherit;
  justify-content: center;
  align-items: center;
  z-index: 100;

  &:before {
    content: '🧚🏽‍';
    font-size: 108px;

    @keyframes grow {
      100% {
        transform: scale(1.2);
      }
    }

    animation-name: grow;
    animation-duration: 1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }
`

l.Fae = styled(g.AbsoluteFlex)`
  width: 100%;
  height: 100%;
  justify-content: center
  align-items: flex-end;
`

l.Faerie = styled(g.AbsoluteFlex)`
  font-size: 108px;
  left: 20px;
  filter: drop-shadow(0 0 20px ${g.theme.susanVeryDark});
  cursor: pointer;

  @keyframes waiting {
    100% {
      transform: scale(1.1);
    }
  }
  &.waiting {
    animation-name: waiting;
    animation-duration: 2s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
    &:hover {
      animation-duration: .5s;
    }
  }
`

l.Nails = styled(l.Faerie)`
  right: 20px;
  left: initial;
  &.waiting {
  }
`
