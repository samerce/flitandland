import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

export const Root = styled(g.Flex)`
  flex-wrap: wrap;
  height: 100%;
  width: 100%;
  position: relative;
  justify-content: center;
  align-items: flex-start;
  padding: 0 20px;

  &.hide {
    display: none;
  }
`

export const Poker = styled(g.FlexColumn)`
  flex: 1 1 30%;
  margin: 0 10px;
  cursor: pointer;
  transition-duration: .3s;
  transition-timing-function: ${c.EASE_OUT};
  align-items: center;

  filter: brightness(100%);
  @keyframes ooo {
    100% {
      filter: brightness(120%);
    }
  }
  ${'' /* animation-name: ooo; */}
  animation-duration: 1s;
  animation-timing-function: ease-in-out;
  animation-iteration-count: infinite;
  animation-direction: alternate;

  &:hover {
    animation-duration: .4s;
    transform: scale(1.05);
  }

  video {
    width: 100%;
    box-shadow: ${g.theme.sexyEdge}, 0 0 10px ${g.theme.susan};
    border-radius: 5px;
  }

  ${g.screen.medmedsmall`
    flex: 1 1 100%;
  `}
`

export const Lampshade = styled(Poker)`
  animation-delay: .27s;
`

export const EymU = styled(Poker)`
  filter: brightness(100%);
  @keyframes pulse {
    100% {
      transform: scale(1.01);
      filter: brightness(110%);
    }
  }
  ${'' /* animation-name: pulse; */}
  animation-delay: .54s;
  img {
    transform: translate(0, -36px);
  }
`

const Image = styled.img`
  width: 100%;
  filter: drop-shadow(1px 1px 0 white)
    drop-shadow(1px 1px 0 ${g.theme.susanDark})
    drop-shadow(0 0 108px ${g.theme.susan});
`

export const WorldImg = styled.img`
  width: 60%;
  transform: translate(0, -54px);
  opacity: .9;
  filter: drop-shadow(0 0 6px ${g.theme.susan})
    drop-shadow(0 0 20px ${g.theme.susanDark});
  ${'' /* bottom: -54px;
  left: 0; */}
`

export const ComingSoon = styled.img`
  width: 400px;
  display: block;
`

export const EymUSun = styled(Image)`
`
