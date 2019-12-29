import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Button)`
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 60px;
  text-align: center;
  font-size: 36px;
  color: white;
  border-radius: 0;
  box-shadow: ${g.theme.sexyEdge},
    0 0 20px ${alpha(.5, g.theme.susanVeryDark)};
  background: ${g.theme.susanDark};
  display: none;
  max-width: unset;
  line-height: 60px;
  padding: 0;

  &.show {
    display: block;
  }
`
