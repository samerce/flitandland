import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'

export const Root = styled(g.FlexColumn)`
  position: relative;
  ${'' /* position: fixed;
  bottom: 0; */}
  margin: 20px 0;
  width: 50%;
  max-width: 540px;
  ${'' /* background: linear-gradient(
    30deg, ${g.theme.susan} 0%, ${g.theme.susanLight} 100%
  ); */}
  align-items: center;
  padding: 0 40px;
  ${'' /* box-shadow: ${g.theme.sexyEdge},
    inset 0 0px 15px ${alpha(.3, g.theme.susanDark)}; */}

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

  ${g.screen.medsmall`
    width: 80%;
  `}
`

export const JoinImage = styled.img`
  width: 100%;
  filter: brightness(100%);
  transition: all .1s;
  pointer-events: none;

  &.words {
    position: absolute;
    opacity: 0;
    width: 80%;
    transform: scale(1.05);

    &.show {
      opacity: 1;
      transform: none;
    }
    ${g.screen.medsmall`
      width: 70%;
    `}
  }
  ${Root}:hover & {
    filter: hue-rotate(540deg) brightness(120%);
  }
`

export const EmailInput = styled.input`
  height: 100%;
  width: 80%;
  text-align: center;
  color: ${g.theme.susan};
  border: none;
  ${'' /* border-bottom: 1px solid ${g.theme.susanLight}; */}
  background: none;
  cursor: pointer;
  font-family: aladin;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(6deg);

  &:focus {
    cursor: text;
    outline: none;
    ${'' /* border-bottom: 1px solid ${g.theme.susanDark}; */}
  }
  &::placeholder {
    color: ${g.theme.susan};
  }
  &:-webkit-autofill {
    font-family: aladin;
    -webkit-text-fill-color: ${g.theme.susanDark};
  }
`

export const JoinButtonRoot = styled.div`
  position: absolute;
  right: 10px;
  opacity: 0;
  filter: blur(10px);
  transform: translate(-50px, -30px) scale(1.1);
  transition: all .3s;
  cursor: pointer;
  pointer-events: none;

  &.show {
    opacity: 1;
    filter: blur(0);
    transform: translate(-50px, -30px) scale(1);
    pointer-events: all;
  }
  &:hover {
    transform: translate(-50px, -30px) scale(1.05);
  }
  &:active {
    transform: translate(-50px, -30px) scale(.95);
  }
`

export const JoinButton = styled.input`
  visibility: hidden;
  width: 100%;
  height: 100%;
  position: absolute;
`

export const JoinButtonImage = styled.img`
  width: 150px;

`
