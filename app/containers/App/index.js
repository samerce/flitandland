import React from 'react';
import GigglyNav from '../../components/GigglyNav/it.coffee';
import What from '../../components/What/it.coffee';

import GlobalStyle from '../../global-styles';
import { Root } from './styled';

export default function App() {
  return (
    <Root>
      <GlobalStyle />
      <GigglyNav />
      <What />
    </Root>
  );
}
