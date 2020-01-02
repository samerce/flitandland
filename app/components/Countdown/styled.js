import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Countdown = styled(g.Flex)`
  position: fixed;
  width: 100%;
  height: 6px;
  background: linear-gradient(
    to bottom, rgba(255, 0, 237, 0.79) 0%, rgba(255, 0, 176, 0.8) 5%, rgba(201, 23, 173, 0.81) 50%, rgba(184, 0, 149, 0.8) 95%, rgba(193, 0, 133, 0.8) 100%
  );
  transform-origin: left center;
  z-index: 100;
  box-shadow: 0 0 10px ${g.theme.susanVeryDark};
  border-radius: 5px;

  &.show {
    transform: scaleX(0);
    transition: all ${p => p.duration}ms linear;

    &.paused {
      transform: none;
    }
  }
`
