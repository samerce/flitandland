import styled, {css, createGlobalStyle} from 'styled-components'
import {transparentize as alpha} from 'polished'
import Theme from './theme'
import {
  SRC_URL,
  EASE_OUT_SINE,
  SCREEN_WIDTH_S, SCREEN_WIDTH_MMS, SCREEN_WIDTH_MS,
  SCREEN_WIDTH_M, SCREEN_WIDTH_ML, SCREEN_WIDTH_L, SCREEN_WIDTH_XL
} from './constants'
import * as c from './constants'

const sizes = {
  small: SCREEN_WIDTH_S,
  medmedsmall: SCREEN_WIDTH_MMS,
  medsmall: SCREEN_WIDTH_MS,
  medium: SCREEN_WIDTH_M,
  mediumlarge: SCREEN_WIDTH_ML,
  large: SCREEN_WIDTH_L,
  xlarge: SCREEN_WIDTH_XL,
}
export const screen = Object.keys(sizes).reduce((result, key) => {
  result[key] = (...args) => css`
    @media (max-width: ${sizes[key] / 16}em) {
      ${css(...args)}
    }
  `
  return result
}, {})

export const TouchMeCss = css`
  filter: drop-shadow(0 0 1px ${alpha(.3, Theme.susan)})
    drop-shadow(0 0 30px ${alpha(.3, Theme.susanVeryDark)});
  animation-name: touchMe;
  animation-duration: 1s;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-timing-function: ease-out;
  transition: all .3s;

  &:hover {
    animation-duration: .2s;
    opacity: 1;
  }
  &:active {
    animation-play-state: paused;
    transform: scale(.98);
    filter: drop-shadow(0 0 1px ${alpha(.3, Theme.susan)})
      drop-shadow(0 0 30px ${alpha(.3, Theme.susanVeryDark)});
  }
  &.disabled {
    pointer-events: none;
    animation: none;
  }
`

export default createGlobalStyle`
  html {
    font-size: 28px;
    line-height: 130%;

    ${screen.xlarge`
      font-size: 22px;
    `}
    ${screen.large`
      font-size: 24px;
    `}
    ${screen.medium`
      font-size: 18px;
    `}
    ${screen.small`
      font-size: 18px;
    `}

    background: ${Theme.eli};
    /*@keyframes fadeInBg {
      100% {
        background: #C004D9;
      }
    }
    animation-name: fadeInBg;
    animation-duration: .1s;
    animation-delay: 2s;
    animation-fill-mode: both;*/
  }
  html,
  body {
    height: 100%;
    width: 100%;
    overflow: hidden;
  }

  body {
    font-family: 'crimson pro', Georgia, serif;
    font-weight: 300;
    color: black;
    background: white;
  }

  body.fontLoaded {
    font-family: 'crimson pro', Georgia, serif;
    font-weight: 300;
  }

  #app {
    min-height: 100%;
    min-width: 100%;
    height: 100%;
    overflow: hidden;
  }

  a {
    display: flex;
    color: white;
    text-decoration: none;
    font-family: aladin;
    user-select: none;
    transition: all .2s ${c.Sexy};
    text-shadow: 1px 1px rgba(0,0,0,.54);

    &:hover {
      filter: invert();
    }
  }

  section {
    flex: 0 0 auto;
    display: flex;
    flex-direction: column;
    text-align: center;
    padding: 20px 0 80px;
  }

  @font-face {
    font-family: 'znikomit24';
    src: url("${c.CDN_URL}fonts/znikomit24/znikomitno24-webfont.woff2") format('woff2'),
         url("${c.CDN_URL}fonts/znikomit24/znikomitno24-webfont.woff") format('woff');
    font-weight: normal;
    font-style: normal;
  }
  @font-face {
    font-family: 'big john';
    src: url("${c.CDN_URL}fonts/big john/big_john-webfont.woff2") format('woff2'),
         url("${c.CDN_URL}fonts/big john/big_john-webfont.woff") format('woff');
    font-weight: normal;
    font-style: normal;
  }
  @font-face {
    font-family: 'slim joe';
    src: url("${c.CDN_URL}fonts/slim joe/slim_joe-webfont.woff2") format('woff2'),
         url("${c.CDN_URL}fonts/slim joe/slim_joe-webfont.woff") format('woff');
    font-weight: normal;
    font-style: normal;
  }

  @keyframes touchMe {
    100% {
      filter: drop-shadow(0 0 5px ${Theme.susan})
        drop-shadow(0 0 30px ${alpha(.3, Theme.susanVeryDark)});
    }
  }
  .touchMe {
    ${TouchMeCss}
  }

  @keyframes colorPlay {
    100% {
      filter: hue-rotate(-216deg) brightness(200%);
    }
  }
`

export const theme = Theme

export const Flex = styled.div`
  display: flex;
`

export const FlexColumn = styled(Flex)`
  flex-direction: column;
`

export const AbsoluteFlex = styled(Flex)`
  position: absolute;
`

export const AbsoluteFlexFillParent = styled(AbsoluteFlex)`
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  align-items: center;
`

export const H1 = styled.h1`
  font-family: princess sofia;
  font-weight: 400;
  font-size: 400%;
  line-height: 90%;
  margin-top: 60px;
`

export const H2 = styled.h2`
  font-family: aladin;
  font-size: 200%;
  line-height: 100%;
`

export const Body = styled.div`
  font-family: "im fell dw pica";
  padding: 0 20px;
  max-width: 780px;
  margin: 0 auto 20px;
  text-align: left;
  font-weight: 100;
  font-size: 22px;

  ${screen.medium`
    font-size: 20px;
  `}
  ${screen.small`
    font-size: 18px;
  `}
`

export const SectionHeader = styled(H1)`
  width: 100%;
  text-align: center;
`

export const Subheader = styled(H2)`
  text-align: center;
  font-style: italic;
  font-family: aladin;
  font-weight: 100;
  margin-top: 0;
`

export const ButtonStyles = css`
  cursor: pointer;
  border: 1px dashed ${theme.main};
  padding: 10px 30px;
  font-size: 150%;
  line-height: 160%;
  font-family: aladin;
  max-width: 90%;
  margin: 0 auto;
  justify-content: center;
  transition: all .3s;
  user-select: none;
  border-radius: 5px;

  &:hover {
    border-style: solid;
    background: ${theme.main};
    color: white;
  }
`

export const Button = styled(Flex)`
  ${ButtonStyles}
`

// E for Emphasis!
export const E = styled.span`
  font-family: aladin;
  font-size; 105%;
`

export const canTilt = p => p.tilt && `
  transform: rotate(${p.tilt}deg);
`

export const cssFaerie = css`
  font-size: 108px;
  filter: drop-shadow(0 0 30px ${Theme.susanVeryDark});
  cursor: pointer;
`
export const Faerie = styled.a`
  ${cssFaerie}
`

export const TextInput = styled.input`
  text-align: center;
  transition: all .3s ${c.EASE_OUT};
  height: 50px;
  padding: 12px;
  font-size: 18px;
  background: white;
  color: ${Theme.susanDark};
  border-radius: 12px;
  box-shadow: ${Theme.sexyEdge};
  border: none;
  user-select: auto !important;

  ::placeholder, ::-webkit-input-placeholder {
    color: black;
    opacity: .67;
  }

  &:hover {
    opacity: 1;
  }

  &:focus {
    opacity: 1;
    outline: none;
  }
`

export const ButtonStyle = css`
  background: white;
  border-radius: 54px;
  border: none;
  color: black;
  font-family: aladin;
  font-size: 27px;
  user-select: none;
  box-shadow: ${Theme.sexyEdge};
  cursor: pointer;
  transition: all .3s ${c.Sexy};

  &:hover {
    filter: invert();
  }
`
