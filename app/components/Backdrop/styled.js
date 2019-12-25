import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import {
  theme, screen, Flex
} from '../../global-styles'

const HeavyShadow = `3px 20px 40px ${theme.veryDark}`

export const Root = styled.div`
  position: absolute;
  height: 100%;
  width: 100%;
  pointer-events: none;
`

export const Background = styled.img`
  width: 100%;
`

export const Background2 = styled.img`
  position: absolute;
  width: 100%;
  top: -170px;
  left: 0;
  opacity: .3;
`

export const Logo = styled.img`
  position: absolute;
  top: 30px;
  left: 50%;
  transform: translate(-50%, 0);
  width: 100%;
  background: ${alpha(.7, '#fae6f6')};
  filter: hue-rotate(0) drop-shadow(${HeavyShadow});

  @keyframes hueMe {
    100% {
      filter: hue-rotate(180deg) drop-shadow(${HeavyShadow});
    }
  }
  animation-name: hueMe;
  animation-duration: 5s;
  animation-iteration-count: infinite;
  animation-direction: alternate;
`
