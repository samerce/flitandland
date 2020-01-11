import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import {animated} from 'react-spring'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.AbsoluteFlex)`
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
  z-index: 900;
  justify-content: center;
  pointer-events: none;
`

l.Go = animated(styled(g.Flex)`
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  text-align: right;
  font-family: aladin;
  font-size: 27px;
  color: ${g.theme.susan};
  background: linear-gradient(to bottom,
    transparent 0%, ${g.theme.susanVeryDark} 100%
  );
  padding: 10px;
  align-items: center;
  justify-content: center;

  i {
    margin: 0 5px;
  }
${'' /*
  @keyframes show {
    0% {
      transform:
      opacity: 0;
    }
    100% {
      transform: none;
      opacity: 1;
    }
  }
  animation-name: show;
  animation-duration: 1s;
  animation-timing-function: ${c.Sexy};
  animation-delay: 5s;
  animation-fill-mode: both; */}
`)
