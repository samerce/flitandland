import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

const HeavyShadow = `3px 20px 40px ${g.theme.veryDark}`
const BackgroundUrl = c.SRC_URL + 'commons/bursting-lq.jpg'

l.Root = styled.div`
  position: absolute;
  height: 100%;
  width: 100%;
  pointer-events: none;
  opacity: .8;
  background: linear-gradient(
    to bottom, #ff00ed 0%, #ff00b0 5%, #c917ad 50%, #b80095 95%, #c10085 100%
  );
`

l.Background = styled.img`
  width: 100%;
`

l.Background2 = styled.img`
  position: absolute;
  width: 100%;
  top: -170px;
  left: 0;
  opacity: .3;
`

l.Logo = styled.img`
  position: absolute;
  top: 30px;
  left: 50%;
  transform: translate(-50%, 0);
  width: 100%;
  background: ${alpha(.7, '#fae6f6')};
  filter: hue-rotate(0) drop-shadow(${HeavyShadow});

  @keyframes hueMe {
    100% {
      filter: hue-rotate(180deg) drop-shadow(${HeavyShadow});
    }
  }
  animation-name: hueMe;
  animation-duration: 5s;
  animation-iteration-count: infinite;
  animation-direction: alternate;
`
