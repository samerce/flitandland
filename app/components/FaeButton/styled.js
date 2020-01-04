import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

const HeavyShadow = `3px 20px 40px ${g.theme.veryDark}`
const BackgroundUrl = c.SRC_URL + 'commons/bursting-lq.jpg'

l.Root = styled(g.Flex)`
  align-items: center;
  justify-content: center;
  font-size: 108px;
  filter: drop-shadow(0 0 1px ${alpha(.3, g.theme.susan)})
    drop-shadow(0 0 30px ${alpha(.3, g.theme.susanVeryDark)});
  cursor: pointer;
  user-select: none;
  transition: all .3s;

  ${g.TouchMeCss}
  animation-delay: ${p => p.delay}s;

  &:hover {
    animation-duration: .2s;
  }
  &:active {
    animation-play-state: paused;
    transform: scale(.98);
    filter: drop-shadow(0 0 1px ${alpha(.3, g.theme.susan)})
      drop-shadow(0 0 10px ${alpha(.3, g.theme.susanVeryDark)});
  }
  &.disabled {
    pointer-events: none;
    animation: none;
  }
`
