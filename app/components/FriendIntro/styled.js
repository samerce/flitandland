import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.AbsoluteFlex)`
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 900;
  background: ${g.theme.pinkGradient};
  ${p => !p.isIntro && `
    display: none;
  `}
`

l.Go = styled(g.Button)`
  position: fixed;
  bottom: 20px;
  left: 50%;
  transform: translate(-50%, 0);
`
