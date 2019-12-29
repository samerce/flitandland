import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled.div`
  display: none;

  &.show {
    display: block;
  }
`

l.Title = styled.div`
  margin: 20px auto 60px;
  font-size: 54px;
  font-family: znikomit24;
  text-align: center;
  width: 100%;
`

const Border = `15px solid ${g.theme.susanDark}`
l.Building = styled(g.FlexColumn)`
  margin: 0 15%;
  max-width: 900px;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  border-left: ${Border};
  border-right: ${Border};
  border-top: ${Border};
`

l.Row = styled(g.Flex)`
  flex: 0 0 300px;
  border-bottom: 5px solid ${g.theme.susanDark};
  overflow: hidden;
`

l.Video = styled.video`
  height: 150%;
  transform: translate(-25%, -18%);
`

l.Image = styled.img`
  width: 100%;
`
