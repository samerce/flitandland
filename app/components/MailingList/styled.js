import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'

export const Root = styled(g.FlexColumn)`
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 60px;
  background: linear-gradient(
    30deg, ${g.theme.susan} 0%, ${g.theme.susanLight} 100%
  );
  align-items: center;
  padding: 0 40px;
  box-shadow: ${g.theme.sexyEdge},
    inset 0 5px 15px ${alpha(.3, g.theme.susanDark)};

  .hiddenInput {
    display: none;
  }
  #mc-embedded-subscribe-form {
    width: 100%;
    height: 100%;
    text-align: center;
  }
  #mc_embed_signup_scroll {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
`

export const EmailInput = styled.input`
  height: 100%;
  width: 80%;
  text-align: center;
  color: ${g.theme.susanVeryDark};
  border: none;
  ${'' /* border-bottom: 1px solid ${g.theme.susanLight}; */}
  background: none;
  cursor: pointer;
  font-family: aladin;

  &:focus {
    cursor: text;
    outline: none;
    ${'' /* border-bottom: 1px solid ${g.theme.susanDark}; */}
  }
  &::placeholder {
    color: ${g.theme.susanDark};
  }
  &:-webkit-autofill {
    font-family: aladin;
    -webkit-text-fill-color: ${g.theme.susanVeryDark};
  }
`

export const JoinButton = styled.input`
  ${g.ButtonStyles}
  position: absolute;
  right: 10px;
  background: ${g.theme.susan};
  font-size: 22px;
  padding: 5px 30px;

  opacity: 0;
  filter: blur(10px);
  transform: translate(100%, 0);
  &.show {
    opacity: 1;
    filter: blur(0);
    transform: none;
  }
`
