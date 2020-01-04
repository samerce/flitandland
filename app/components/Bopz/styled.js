import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  width: 100%;
`

l.Centered = styled(g.Flex)`
  width: 100%;
  height: 100%;
  justify-content: center;
  align-items: center;
  background: inherit;

  &.scrollX {
    overflow-x: scroll;
    justify-content: flex-start;
  }
`

l.Credit = styled(g.AbsoluteFlex)`
  bottom: 0;
  left: 0;
  width: 100%;
  height: 30px;
  color: white;
  justify-content: center;
  font-size: 10px;
`

l.Image = styled.img`
  width: 90%;
  border-radius: 5px;
  margin: 0 auto;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy},
    ${g.theme.prettyFrame};

  &.fullHeight {
    width: initial
    height: 90%;
  }
`

l.Yearbook = styled(g.AbsoluteFlex)`
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
`

l.Cell = styled.div`
  flex: 0 0 30%;
  height: 20%;
  margin: 0 1%;
`

l.GridImage = styled(l.Image)`
  opacity: 0;
  transform: rotate(${p => (Math.round(Math.random()) * -2 + 1) * Math.round(2 * (8000 / p.delay))}deg);

  @keyframes full {
    100% {
      opacity: 1;

    }
  }
  animation-duration: 2s;
  animation-timing-function: ease-out;
  animation-fill-mode: both;
  animation-iteration-count: 1;

  ${p => p.mode === 'show' && `
    animation-name: full;
  `}
`

l.Video = styled.video`
  height: 90%;
  box-shadow: ${g.theme.prettyFrame}, ${g.theme.sexyEdge},
    ${g.theme.shadowVeryHeavy};
  border-radius: 5px;

  &.fullWidth {
    height: initial;
    width: 90%;
  }
  &.backdrop {
    height: 100%;
    box-shadow: none;
  }
`
