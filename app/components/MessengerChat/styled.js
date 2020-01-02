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
  }
  .fb-customerchat iframe {
    animation-duration: 0s !important;
  }
`
