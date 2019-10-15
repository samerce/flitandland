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
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  }

  body.fontLoaded {
    font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
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
    border-top: 2px solid ${Theme.main};
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
  font-family: "goudy bookletter 1911";
`

export const Body = styled.div`
  font-family: "goudy bookletter 1911";
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
  font-style: italic;
`

export const Matrix = styled(Flex)`
  width: 100%;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  padding: 20px;
`

export const MatrixItem = styled(Flex)`
  align-items: center;
  flex: 0 0 50%;
  margin: 40px 0;
  padding: 0 5%;
`

export const MatrixItemIcon = styled.i`
  font-size: 72px;
  flex: 0 0 100px;
  text-align: center;
`

export const MatrixItemText = styled(Body)`
  margin: 0;
  max-width: 300px;
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
