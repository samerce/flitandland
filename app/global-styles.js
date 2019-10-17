import styled, { createGlobalStyle } from 'styled-components'
import Theme from './theme'
import {
  EASE_OUT_SINE
} from './constants'

export default createGlobalStyle`
  html,
  body {
    height: 100%;
    width: 100%;
  }

  body {
    font-family: 'im fell dw pica', Georgia, serif;
    color: white;
  }

  body.fontLoaded {
    font-family: 'im fell dw pica', Georgia, serif;
  }

  #app {
    background-color: #fafafa;
    min-height: 100%;
    min-width: 100%;
  }

  a {
    text-decoration: none;
  }

  p,
  label {
    font-family: Georgia, Times, 'Times New Roman', serif;
    line-height: 1.5em;
  }

  section {
    border-top: 1px solid ${Theme.main};
    flex: 0 0 auto;
    flex-direction: column;
    text-align: center;
    padding: 0 0 80px;
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
  font-size: 72px;
`

export const H2 = styled.h2`
  font-family: "im fell dw pica";
`

export const Body = styled.div`
  font-family: "im fell dw pica";
  font-size: 22px;
  padding: 0 20px;
  max-width: 780px;
  margin: 0 auto 20px;
`

export const SectionHeader = styled(H1)`
  width: 100%;
  text-align: center;
`

export const Subheader = styled(H2)`
  text-align: center;
`

export const Matrix = styled(Flex)`
  width: 100%;
  max-width: 1024px;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  padding: 20px;
  margin: 0 auto;
`

export const MatrixItem = styled(Flex)`
  align-items: center;
  justify-content: center;
  flex: 1 0 50%;
  cursor: pointer;
  filter: none;
  transition: all .3s ${EASE_OUT_SINE};

  &:hover {
    filter: drop-shadow(100px);
  }
`

export const MatrixItemIcon = styled.i`
  font-size: 72px;
  flex: 0 0 100px;
  text-align: center;
`

export const MatrixItemTitle = styled(H1)`
  margin: 20px 0;
  font-size: 54px;
  padding: 0 20px;
`

export const MatrixItemText = styled(Body)`
  margin: 0;
  max-width: 300px;
  font-size: 28px;
  font-weight: bold;
`

export const Button = styled(Flex)`
  cursor: pointer;
  border: 1px dashed ${theme.main};
  padding: 10px 20px;
  font-size: 32px;
  font-family: aladin;
  max-width: 400px;
  margin: 0 auto;
  justify-content: center;
  transition: all .3s ${EASE_OUT_SINE};
  user-select: none;

  &:hover {
    border-style: solid;
    background: ${theme.main};
    color: white;
  }
`
