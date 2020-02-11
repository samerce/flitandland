import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import {animated} from 'react-spring'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  width: 100%;
`

l.Centered = animated(styled(g.FlexColumn)`
  width: 100%;
  height: 100%;
  justify-content: center;
  align-items: center;
  background: inherit;
  overflow: hidden;
  position: relative;

  &.scrollX {
    overflow-x: scroll;
    justify-content: flex-start;
  }
  .youtubeVid {
    box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy},
      ${g.theme.prettyFrame};
    border-radius: 5px;
  }
`)

l.Credit = styled(g.Flex)`
  width: 100%;
  height: 30px;
  margin: 20px 0;
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
  pointer-events: none;

  &.fullHeight {
    width: initial;
    height: 90%;
  }
  &.revo {
    background: radial-gradient(circle at center, white 0%, #6D0FF2 100%);
  }
  &.cover {
    margin: 27px 0;
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
  position: relative;
  flex: 0 0 30%;
  height: 20%;
  margin: 0 1%;
`

l.GridImage = styled(l.Image)`
  opacity: 0;
  transform: rotate(${p => (Math.round(Math.random()) * -2 + 1) * Math.round(2 * (8000 / p.delay))}deg);
  position: absolute;
  top: 0;
  left: 0;

  @keyframes full {
    100% {
      opacity: 1;
    }
  }
  animation-duration: 2s;
  animation-timing-function: ease-out;
  animation-fill-mode: both;
  animation-iteration-count: 1;
  animation-name: ${p => p.show? 'full' : ''};
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

l.IntroText = animated(styled.div`
  font-size: 27px;
  line-height: 30px;
  flex: 0 0 auto;
  height: 0;
  width: fit-content;
  max-width: 794px;
  font-family: aladin;
  background: ${g.theme.pinkGradient};
  color: ${g.theme.susan};
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy};
  border-radius: 108px;
  opacity: 0;
  transform: scale(.9);
  padding: 0 36px;

  @keyframes reveal {
    100% {
      height: initial;
      margin: 27px 0;
      padding: 36px 54px;
      opacity: 1;
      transform: scale(1);
    }
  }
  animation-duration: .5s;
  animation-fill-mode: both;
  animation-timing-function: ${c.Sexy};
  animation-delay: ${p => p.delay}ms;

  &.show {
    animation-name: reveal;
  }

  i {
    margin: 0 9px;
    @keyframes spin {
      100% {
        transform: rotate(720deg);
      }
    }
    animation-name: spin;
    animation-duration: .5s;
    animation-timing-function: ${c.Sexy};
    animation-direction: alternate;
    animation-iteration-count: infinite;
  }
  div {
    display: inline;
  }
`)

l.LandingPage = styled(l.Centered)`
  flex-wrap: wrap;
  justify-content: space-evenly;
  height: initial;
  margin: 54px 0;
`

l.Header = styled.div`
  font-size: 54px;
  font-family: big john;
  color: white;
  height: 54px;
  line-height: 54px;
  margin: 27px 0;
`
