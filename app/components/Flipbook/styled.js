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

  .flipbook-button  {
    position: absolute;
    display: flex;
    justify-content: center
    align-items: flex-end;
    bottom: 0;

    &.tinkerbell {
      left: 20px;
    }
    &.nails {
      right: 20px;
    }
  }
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
  z-index: 1000;

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

l.Faerie = styled.div`
`

l.Tinkerbell = styled(l.Faerie)`
`

l.Nails = styled(l.Faerie)`
`
