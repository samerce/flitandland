import styled, { createGlobalStyle } from 'styled-components';
import theTheme from './theme';

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

  p,
  label {
    font-family: Georgia, Times, 'Times New Roman', serif;
    line-height: 1.5em;
  }
`;

export const theme = theTheme;

export const Flex = styled.div`
  display: flex;
`;

export const FlexColumn = styled(Flex)`
  flex-direction: column;
`;

export const AbsoluteFlex = styled(Flex)`
  position: absolute;
`;

export const AbsoluteFlexFillParent = styled(AbsoluteFlex)`
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  align-items: center;
`;
