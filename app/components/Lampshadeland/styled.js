import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

const HeavyShadow = `3px 20px 40px ${g.theme.veryDark}`
const BackgroundUrl = c.SRC_URL + 'commons/bursting-lq.jpg'

l.Root = styled(g.Flex)`
  padding: 60px 20px 0;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  display: none;

  &.show {
    display: flex;
  }
`

l.Diamond = styled(g.Flex)`
  flex: 0 0 200px;
  height: 200px;
  margin: 0 10px;
  box-shadow: 0 0 0 1px ${alpha(.5, g.theme.susan)},
    0 0 0 4px ${g.theme.susanVeryDark},
    0 0 0 5px ${alpha(.5, g.theme.susanLight)},
    0 0 0 6px ${alpha(.5, g.theme.susanVeryDark)},
    0 0 40px ${g.theme.susanVeryDark};
  transform: rotate(45deg);
  overflow: hidden;
`

l.Content = styled(g.Flex)`
  width: 100%;
  height: 100%;
  transform: rotate(-45deg);
`

l.Video = styled.video`
  height: 150%;
  transform: translate(-25%, -18%);
`

l.Image = styled.img`
  height: 100%;
`
