import styled, {css} from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  width: 100%;
  height: 100%;
  overflow: hidden;
  position: relative;

  .flipbook-button  {
    position: fixed;
    display: flex;
    justify-content: center
    align-items: flex-end;
    bottom: 50px;
    z-index: 500;
    transition: all .3s ${c.Sexy};

    @keyframes popIn {
      0% {
        filter: blur(10px);
        opacity: 0;
        transform: scale(.98);
      }
      100% {
        filter: none;
        opacity: 1;
        transform: none;
      }
    }
    &.tinkerbell {
      left: 20px;

      &.intro {
        bottom: calc(60% - 108px);
      }
    }
    &.nails {
      right: 20px;
      &.intro {
        bottom: calc(60% - 216px);
        animation-delay: 1s;
      }
    }
    &.intro {
      z-index: 1000;
      ${'' /* animation-name: popIn;
      animation-duration: 2s;
      animation-fill-mode: both;
      animation-timing-function: ${c.Sexy}; */}
    }
    &.sunrise {
      opacity: 0;
      transform: scale(.99);
      pointer-events: none;
      transition: all .3s ${c.Sexy};

      &.showSunrise {
        pointer-events: all;
        transform: translate(180px, 0);
        opacity: 1;
      }
      &.intro {
        display: none;
      }
    }
  }
`

l.PageRoot = styled(g.AbsoluteFlex)`
  width: 100%;
  height: 100%;
  overflow: hidden;
  transform: scale(1.01);
  opacity: 0;

  &.preload {
    visibility: hidden;
    pointer-events: none;
  }

  &.hide {
    display: none;
    transform: scale(.99);
    transition:
      transform .3s ${c.Sexy}, opacity .3s ${c.Sexy}, display .05s linear .3s;
  }

  &.show {
    @keyframes show {
      85% {
        opacity: 1;
      }
      100% {
        transform: none;
        opacity: 1;
      }
    }
    animation-name: show;
    animation-duration: .5s;
    animation-timing-function: ${c.Sexy};
    animation-fill-mode: both;
    animation-delay: .1s;
  }
`

l.Spinner = styled(g.AbsoluteFlex)`
  width: 100%;
  height: 100%;
  background: inherit;
  justify-content: center;
  align-items: center;
  z-index: 1000;

  &:before {
    content: '🧚🏽‍';
    font-size: 108px;

    @keyframes grow {
      100% {
        transform: scale(1.2);
      }
    }

    animation-name: grow;
    animation-duration: 1s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }
`

const makeFlyIn = (name, zeroStyle) => css`
  @keyframes ${name} {
    0% {
      opacity: 0;
      filter: blur(10px);
      ${zeroStyle}
    }
    85% {
      opacity: 1;
      filter: none;
    }
    100% {
      opacity: 1;
      filter: none;
      transform: none;
    }
  }
`

l.Faerie = styled.div`
  .intro & {
    animation-timing-function: ${c.Sexy};
    animation-duration: .5s;
  }
`

l.IntroText = styled.div`
  visibility: hidden;
  font-size: 36px;
  padding: 0 10px;
  width: 0;

  .intro & {
    @keyframes upReveal {
      0% {
        visibility: visible;
        opacity: 0;
        filter: blur(10px);
        width: 0;
      }
      100% {
        visibility: visible;
        opacity: 1;
        filter: none;
        width: initial;
      }
    }

    animation-name: upReveal;
    animation-duration: .5s;
    animation-fill-mode: both;
    animation-delay: 1.5s;
    animation-timing-function: ${c.Sexy};
  }
`

l.Sunrise = styled(l.Faerie)`
  font-size: 54px;
`

l.Tinkerbell = styled(l.Faerie)`
  .intro & {
    ${makeFlyIn('tinker', css`
      transform: translate(-500px, 0) scale(.95);
    `)}
    animation-name: tinker;
    animation-delay: .5s;
  }
`

l.Nails = styled(l.Faerie)`
  .intro & {
    ${makeFlyIn('nails', css`
      transform: translate(500px, 0) scale(.95);
    `)}
    animation-name: nails;
    animation-delay: 1s;
  }
  ${l.IntroText} {
    animation-delay: 2s;
  }
`
