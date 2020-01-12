import styled, {css} from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import {animated} from 'react-spring'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.FlexColumn)`
  width: 100%;
  height: 100%
  overflow: hidden;
  position: relative;
  user-select: none;
  z-index: 2000;
  justify-content: flex-end;

  ${g.screen.medsmall`
    padding: 9px;
  `}

  .swipe-page {
    width: 100%;
    height: 100%;
  }

  .flipbook-button {
    display: flex;
    justify-content: center
    align-items: center;
    z-index: 500;
    transition: all .3s ${c.Sexy};
    pointer-events: all;
    cursor: pointer;
    position: fixed;
    bottom: 18px;
    left: 50%;
    transform: translate(-50%, 0);
  }
`

l.PageRoot = styled(g.Flex)`
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  transform: scale(1.05);
  opacity: 0;
  overflow: scroll;
  pointer-events: none;

  &.preload {
    visibility: hidden;
  }

  &.hide {
    @keyframes hide {
      0% {
        opacity: 1;
        transform: scale(1);
      }
      99% {
        transform: scale(.95);
        opacity: 0;
      }
      100% {
        transform: scale(.95);
        opacity: 0;
      }
    }
    animation-name: hide;
    animation-duration: .3s;
    animation-fill-mode: both;
    animation-timing-function: ${c.Sexy};
  }

  &.show {
    pointer-events: all;

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

l.Nails = animated(styled(l.Faerie)`
  background: linear-gradient(to bottom,
    ${g.theme.susanDark} 0%, ${g.theme.susanVeryDark} 100%
  );
  border-radius: 100%;
  padding: 18px;
  box-shadow: ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy},
    inset 0 0 10px ${g.theme.susanVeryDark};

  ${l.IntroText} {
    animation-delay: 2s;
  }
  img {
    width: 50px;
  }
`)
