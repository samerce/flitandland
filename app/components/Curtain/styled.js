import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  position: fixed;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  transform: rotate(45deg) scale(1.5);
  cursor: pointer;
  pointer-events: none;

  @keyframes enable {
    100% {
      pointer-events: all;
    }
  }
  animation-name: enable;
  animation-duration: .1s;
  animation-fill-mode: both;
  animation-delay: 10s;
`

l.Fold = styled.div`
  flex: ${p => (p.i % 2)? 1 : 2} 0 auto;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy};
  height: 150%;
  background: ${p => (p.i % 2)? g.theme.susan : g.theme.susanVeryDark};
  border-radius: 54px;

  @keyframes slideIn {
    0% {
      transform: translate(0, ${p => (p.i % 2)? '-100%' : '100%'});
    }
    100% {
      transform: none;
    }
  }
  animation-name: slideIn;
  animation-duration: .5s;
  animation-timing-function: ${c.Sexy};
  animation-delay: ${p => 1000 + p.i * 100}ms;
  animation-fill-mode: both;

  @keyframes slideOut {
    0% {
      transform: none;
    }
    100% {
      transform: translate(0, ${p => (p.i % 2)? '-100%' : '100%'});
    }
  }
  &.out {
    animation-name: slideOut;
  }
`
