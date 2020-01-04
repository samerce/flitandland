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
  cursor: pointer;
  user-select: none;

  ${g.TouchMeCss}
  animation-delay: ${p => p.delay}s;
`
