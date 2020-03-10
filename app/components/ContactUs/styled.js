import styled, {createGlobalStyle} from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.GlobalStyle = createGlobalStyle`
  .contactUsSheet .sheet {
    z-index: 9000;
    max-width: 756px;
    max-height: 432px;
  }
`

l.Title = styled.div`
  flex: 0 0 100%;
  font-size: 27px;
  font-family: big john;
  text-align: center;
  color: white;
  margin: 0 0 18px;
`

l.Subtitle = styled(l.Title)`
  font-size: 20px;
  font-family: crimson pro;
`

l.Email = styled(g.TextInput)`
  flex: 0 0 100%;
`

l.Message = styled.textarea`
  flex: 0 0 100%;
  height: 108px;
  border-radius: 12px;
  padding: 12px;
  font-size: 18px;
  box-shadow: ${g.theme.sexyEdge};
  border: none;
  margin: 12px 0;
  resize: none;
`

l.Send = styled.div`
  ${g.ButtonStyle}
  flex: 0 0 100%;
  text-align: center;
  padding: 9px;
  pointer-events: none;
  background: black;
  color: white;

  &.idle {
    pointer-events: all;
  }
  &.sending, &.sent, &.failed {
    filter: invert();
  }
`
