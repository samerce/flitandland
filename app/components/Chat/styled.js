import styled, {createGlobalStyle, css} from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

const ScreenMiddle = css`
  right: 50% !important;
  transform: translate(50%, 0);
`
// .intro & {
//   bottom: calc(100% - 324px) !important;
//   right: calc(100% - 108px) !important;
//   pointer-events: none;
//   transform: scale(1.5);
//   transform-origin: left center;
// }
const HiddenCss = css`
  opacity: 0;
  visibility: hidden;
  pointer-events: none;
`
l.Style = createGlobalStyle`
  .fb_dialog {
    ${HiddenCss}
  }
  .fb_dialog, .fb-customerchat iframe {
    z-index: 2000;
    box-shadow: 0 0 20px ${g.theme.susanVeryDark}, ${g.theme.sexyEdge};
    transition: all .5s;
  }
  .fb-customerchat iframe {
    animation-duration: 0s !important;
    z-index: 3000 !important;
    box-shadow: 0 0 20px ${g.theme.susanVeryDark};
    background: ${g.theme.susanDark};
    bottom: 216px !important;
  }
  .chat-button {
    position: fixed;
    bottom: 162px;
    right: 27px;
    &.insta {
      transform: translate(-108px, 0);
    }
    &.twitter {
      transform: translate(-216px, 0);
    }
  }
`

l.Fae = styled(g.AbsoluteFlex)`
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  pointer-events: none;
  transform: scale(.99);
  filter: blur(10px);
  opacity: 0;
  transition: all .3s;
  z-index: 4000;
  visibility: hidden;

  &.show {
    visibility: visible;
    @keyframes show {
      to {
        transform: none;
        filter: none;
        opacity: 1;
      }
    }
    animation-name: show;
    animation-duration: .5s;
    animation-fill-mode: both;
    animation-timing-function: ${c.Sexy};
  }
`

const FaerieMessenger = styled.a`
  font-size: 54px;
  .show & {
    pointer-events: all;
  }
`

l.Mail = styled(FaerieMessenger)`
`

l.Insta = styled(FaerieMessenger)`
`

l.Twitter = styled(FaerieMessenger)`
`

l.ButtonTitle = styled(g.AbsoluteFlex)`
  justify-content: flex-end;
  align-items: flex-end;
  width: 100%;
  height: 100%;
  font-family: aladin;
  font-size: 18px;
  line-height: 115%;
  filter: drop-shadow(0 0 2px ${g.theme.susanVeryDark})
    drop-shadow(3px 5px 10px ${g.theme.susanVeryDark});
  font-weight: 600;
  pointer-events: none;
  opacity: .8;
  color: ${g.theme.susan};
`
