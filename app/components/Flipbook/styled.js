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
  user-select: none;
  z-index: 2000;

  &.intro {
    pointer-events: none;
  }

  .swipe-page {
    width: 100%;
    height: 100%;
    transform: translate3d(${p => p.x}px, ${p => p.y}px, 0);
  }

  .flipbook-button  {
    position: fixed;
    display: flex;
    justify-content: center
    align-items: flex-end;
    bottom: 20px;
    z-index: 500;
    transition: all .3s ${c.Sexy};
    pointer-events: all;

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
      display: none;
      left: 20px;

      &.intro {
        bottom: calc(60% - 108px);
      }
    }
    &.nails {
      bottom: 50%;
      right: 50%;
      transform: translate(50%, 50%);
      align-items: center;
      ${'' /* &.intro {
        transform: translate(50%, -50%);
        animation-delay: 1s;
      } */}
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
    &.yes, &.no {
      right: 25%;
      transform: translate(50%, 0px);
    }
    &.no {
      right: 75%;
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
      ${zeroStyle}
    }
    85% {
      opacity: 1;
    }
    100% {
      opacity: 1;
      transform: none;
    }
  }
`

l.Faerie = styled.div`
  animation-timing-function: ${c.Sexy};
  animation-fill-mode: both;

  .intro & {
    animation-duration: .5s;
  }
`

l.IntroText = styled.div`
  visibility: hidden;
  font-size: 42px;
  line-height: 46px;
  padding: 20px;
  flex: 0 0 100%;
  max-width: 780px;
  opacity: 0;
  display: none;
  font-family: just another hand;
  background: ${g.theme.pinkGradient};
  color: ${g.theme.susan};
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy};

  .intro & {
    display: block;
    transform-origin: left center;
    @keyframes upReveal {
      0% {
        visibility: visible;
        transform: scale(0);
      }
      100% {
        visibility: visible;
        opacity: 1;
        transform: none;
      }
    }

    animation-name: upReveal;
    animation-duration: .5s;
    animation-fill-mode: both;
    animation-delay: 4.5s;
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

l.Yes = styled(l.Faerie)`

`

l.No = styled(l.Faerie)`

`

l.Nails = styled(l.Faerie)`
  ${'' /* transform: scale(.95);
  opacity: 0;
  .intro & {
    ${makeFlyIn('nails', css`
      opacity: 0;
      transform: scale(.95);
    `)}
    animation-name: nails;
    animation-delay: 4s;
  } */}

  background: linear-gradient(to bottom,
    ${g.theme.susanDark} 0%, ${g.theme.susanVeryDark} 100%
  );
  border-radius: 100%;
  padding: 36px;
  box-shadow: ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy},
    inset 0 0 10px ${g.theme.susanVeryDark};

  ${l.IntroText} {
    animation-delay: 2s;
  }
  img {
    width: 100px;
  }
`
