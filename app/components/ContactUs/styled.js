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
    height: 432px;
    flex: 0 0 432px;

    ${g.screen.medsmall`
      max-width: 99%;
    `}
  }
`

l.Title = styled.div`
  flex: 0 0 100%;
  font-size: 54px;
  font-family: big john;
  text-align: center;
  color: white;
  margin: 18px 0 0;

  ${g.screen.medsmall`
    font-size: 36px;
  `}
`

l.Subtitle = styled(l.Title)`
  font-size: 20px;
  font-family: crimson pro;
  margin: 0 0 9px;
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

  ::placeholder, ::-webkit-input-placeholder {
    color: black;
    opacity: .67;
  }
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
