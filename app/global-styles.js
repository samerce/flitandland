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
    flex: 0 0 auto;
    flex-direction: column;
    text-align: center;
    padding: 40px 0 80px;
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
  font-size: 81px;
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
  text-align: left;
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
  flex: 0 0 100%;
  transition: all .3s ${EASE_OUT_SINE};
  padding: 40px;
`

export const MatrixItemContent = styled(FlexColumn)`
  flex: 1;

  &.right {
    text-align: right;
    padding-right: 40px;
  }
  &:not(.right) {
    text-align: left;
    padding-left: 40px;
  }
`

export const MatrixItemIcon = styled.i`
  font-size: 72px;
  flex: 0 0 100px;
  text-align: center;
`

export const MatrixItemTitle = styled(H1)`
  margin: 0 0 20px;
  font-size: 54px;
  padding: 0 20px;
`

export const MatrixItemText = styled(Body)`
  margin: 0;
  font-size: 22px;
  max-width: 800px;
  text-align: inherit;
`

export const MatrixImage = styled.img`
  height: 300px;
  padding: 0 10px;
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
  border-radius: 5px;

  &:hover {
    border-style: solid;
    background: ${theme.main};
    color: white;
  }
`
