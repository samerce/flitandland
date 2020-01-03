import styled, {createGlobalStyle} from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Style = createGlobalStyle`
  .fb_dialog, .fb-customerchat iframe {
    right: 50% !important;
    transform: translate(50%, 0);
    z-index: 200;
    box-shadow: 0 0 20px ${g.theme.susanVeryDark}, ${g.theme.sexyEdge};
  }
  .fb-customerchat iframe {
    animation-duration: 0s !important;
    z-index: 300 !important;
    box-shadow: 0 0 20px ${g.theme.susanVeryDark};
    background: rgba(255,255,255,.5);
  }
  .chat-button {
    position: fixed;
    bottom: 80px;
    left: 50%;
  }
`

l.Fae = styled(g.AbsoluteFlex)`
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  pointer-events: none;
  transform: scale(.95);
  filter: blur(10px);
  opacity: 0;
  transition: all .3s;
  z-index: 400;

  &.show {
    transform: none;
    filter: none;
    opacity: 1;
  }
`

const FaerieMessenger = styled.a`
  .show & {
    pointer-events: all;
  }
`

l.Mail = styled(FaerieMessenger)`
  transform: translate(-220px, 10px);
`

l.Insta = styled(FaerieMessenger)`
  transform: translate(-50%,-220px);
`

l.Twitter = styled(FaerieMessenger)`
  transform: translate(120px, 0);
`
