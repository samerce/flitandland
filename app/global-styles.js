import styled, {css, createGlobalStyle} from 'styled-components'
import Theme from './theme'
import {
  SRC_URL,
  EASE_OUT_SINE,
  SCREEN_WIDTH_S, SCREEN_WIDTH_MMS, SCREEN_WIDTH_MS,
  SCREEN_WIDTH_M, SCREEN_WIDTH_ML, SCREEN_WIDTH_L, SCREEN_WIDTH_XL
} from './constants'

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
    background-color: rgba(184, 0, 149, 0.8);
  }
  html,
  body {
    height: 100%;
    width: 100%;
  }

  body {
    font-family: 'crimson pro', Georgia, serif;
    font-weight: 300;
    color: white;
  }

  body.fontLoaded {
    font-family: 'crimson pro', Georgia, serif;
    font-weight: 300;
  }

  #app {
    background-color: #fafafa;
    min-height: 100%;
    min-width: 100%;
    height: 100%;
  }

  a {
    color: inherit;
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
    src: url("${SRC_URL}fonts/znikomit24/znikomitno24-webfont.woff2") format('woff2'),
         url("${SRC_URL}fonts/znikomit24/znikomitno24-webfont.woff") format('woff');
    font-weight: normal;
    font-style: normal;
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
  font-family: just another hand;
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

export const Matrix = styled(Flex)`
  width: 100%;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  padding: 20px;
  margin: 0 auto;
`

export const MatrixItem = styled(Flex)`
  align-items: center;
  justify-content: center;
  flex: 0 0 100%;
  max-width: 1920px;
  transition: all .3s;
  padding: 40px;
  margin: 20px 0;

  &.right {
    flex-direction: row-reverse;
  }

  ${screen.xlarge`
    flex: 0 0 100%;
  `}
  ${screen.large`
    &, &.right {
      margin: 40px 0;
      padding: 10px 5px;
      flex-direction: column;
    }
  `}
`

export const MatrixItemContent = styled(FlexColumn)`
  flex: 1;
  text-align: left;
  padding-left: 40px;

  .right & {
    text-align: right;
    padding-right: 40px;
    padding-left: 0;
    align-items: flex-end;
  }
  ${screen.large`
    &, .right && {
      padding: 0;
      margin: 60px 0 0;
      text-align: center;
      align-items: center;
    }
  `}
`

export const MatrixItemIcon = styled.i`
  font-size: 72px;
  flex: 0 0 100px;
  text-align: center;
`

export const MatrixItemTitle = styled(H1)`
  margin: 0 0 20px;
  font-size: 81px;

  ${screen.xlarge`
    font-size: 280%;
  `}
`

export const MatrixItemText = styled(Body)`
  margin: 0;
  max-width: 800px;
  text-align: inherit;

  ${screen.xlarge`
    font-size: 110%;
    line-height: 125%;
  `}
  ${screen.medium`
    padding: 0;
  `}
`

export const MatrixImage = styled.img`
  max-width: 50%;
  border: 30px solid white;
  border-bottom-width: 60px;
  border-radius: 3px;
  box-shadow: ${theme.shadowVeryHeavy};
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
