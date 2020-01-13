import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.AbsoluteFlex)`
  top: 0;
  left: 0;
  z-index: 5000;
  width: 100%;
  height: 100%;
  overflow-y: scroll;
  flex-wrap: wrap;
  display: none;

  &.visible {
    display: flex;
  }
`

l.PageRoot = styled(g.Flex)`
  flex: 1;
`
