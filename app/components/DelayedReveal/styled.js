import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  display: none;

  &.willShow, &.show {
    display: flex;
  }
`
