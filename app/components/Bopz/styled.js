import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  width: 100%;
`

l.Image = styled.img`
  width: 100%;
  margin: 0 auto;
  transform: translate(0, -10%);
`

l.LImage = styled(l.Image)`
  position: absolute;
  width: 500px;
  top: 20px;
  left: 20px;
`
