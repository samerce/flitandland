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
  min-height: 100%;
  justify-content: center;
  align-items: center;
  position: relative;

  &.scrollX {
    overflow-x: scroll;
    justify-content: flex-start;
  }
  &.intro {
    padding: 27px;
  }
  &.sneakers {
    height: 100%;

    ${g.screen.medium`
      height: initial;
    `}
  }
  &.ping {
    background: ${g.theme.ben};
    color: white;
  }
  &.pong {
    background: ${g.theme.dan};
    color: white;
  }
  &.bottom {
    min-height: initial;
    flex-direction: row;
    padding: 27px 0;
    background: ${g.theme.eli};
    box-shadow: ${g.theme.shadowHeavy}, ${g.theme.sexyEdge};
    scroll-snap-align: end;

    i {
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 108px;
      margin: 27px;
      color: white;
      transition: all .3s ${c.Sexy};
      &:hover {
        filter: invert();
      }
    }
  }
  .youtubeVid {
    box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy},
      ${g.theme.prettyFrame};
    border-radius: 5px;
  }

  a {
    justify-content: center;
    align-items: center;
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
  width: 85%;
  border-radius: 5px;
  margin: 0 auto;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy},
    ${g.theme.prettyFrame};
  pointer-events: none;

  &.fullHeight, &:not(.portrait) {
    width: initial;
    height: ${p => p.fullHeight}px;
  }
  &.revo {
    background: ${g.theme.gradient};
  }
  &.cover {
    margin: 27px 0;
    height: ${p => p.height}px;
  }
  ${g.screen.medsmall`
    &, &.fullHeight {
      width: 85%;
      height: initial;
    }
  `}
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

l.Video = styled.div`
  height: 85%;
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
    ${g.screen.medsmall`
      height: 100%;
      width: initial;
    `}
  }
  ${g.screen.medsmall`
    &, &.fullWidth {
      width: 85%;
      height: initial;
    }
  `}
`

l.VideoRoot = styled.div`
  position: relative;
`
l.VideoSoundPrompt = styled(g.AbsoluteFlexFillParent)`
  justify-content: center;
  align-items: flex-end;
  padding: 36px;
  font-size: 18px;
  font-family: aladin;
  color: white;
  opacity: .81;
  &.hide {
    display: none;
    pointer-events: none;
  }
`

l.IntroText = animated(styled.div`
  font-size: 27px;
  line-height: 30px;
  flex: 0 0 auto;
  width: fit-content;
  max-width: 794px;
  font-family: aladin;
  background: ${g.theme.gradient};
  color: black;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy};
  border-radius: 108px;
  opacity: 0;
  transform: scale(.9);
  padding: 36px 54px;
  margin: 27px 0;

  ${g.screen.medsmall`
    padding: 27px 18px;
  `}

  @keyframes reveal {
    100% {
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
  ${g.screen.medsmall`
    font-size: 18px;
    line-height: 22px;
    padding: 0 18px;
  `}
`)

l.LandingPage = styled(l.Centered)`
  flex-wrap: wrap;
  justify-content: space-evenly;
  height: initial;
`

const CenteredFlex = styled(g.Flex)`
  align-items: center;
  justify-content: center;
`

l.Header = styled.a`
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 54px;
  font-family: big john;
  color: white;
  background: black;
  width: 100%;
  height: 72px;
  line-height: 72px;
  text-align: center;
  ${'' /* text-shadow: 1px 1px white, 2px 2px white, 3px 3px white; */}

  ${g.screen.medium`
    font-size: 36px;
  `}
  ${g.screen.medsmall`
    font-size: 27px;
  `}
  ${g.screen.small`
    font-size: 18px;
  `}
`

l.Pot = styled.div`
  font-size: 54px;
  line-height: 62px;
  font-family: aladin;
  padding: 108px 27px;
  text-align: center;
  background: ${g.theme.dan};
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy};
  border-radius: 5px;
  color: white;

  ${g.screen.medsmall`
    font-size: 18px;
    line-height: 24px;
  `}
  ${g.screen.small`
    font-size: 15px;
    line-height: 21px;
  `}

  a {
    color: ${g.theme.cal};
    text-decoration: underline;
    &:hover {
      color: ${g.theme.ben};
    }
  }

  ${'' /* &.shock {
    align-self: flex-end;
    margin-bottom: 108px;
  } */}

  &.titleCard {
    font-family: big john;
    background: none;
    box-shadow: none;
    color: black;
  }
`

l.zon = styled.span`
  font-family: znikomit24;
`

l.yow = styled.span`
  font-family: slim joe;
`

l.woo = styled.span`
  font-family: big john;
`

l.more = styled.a`
  position: absolute;
  display: flex;
  bottom: 27px;
  left: 50%;
  padding: 12px 36px;
  border-radius: 108px;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowHeavy};
  background: ${g.theme.ann};
  color: white;
  font-size: 22px;
  font-family: aladin;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  user-select: none;

  transition: all .5s ${c.Sexy};
  transform: translate(-50%, 0);
  &.hide {
    transform: translate(-50%, 0) scale(.95);
    filter: blur(5px);
    opacity: 0;
    pointer-events: none;
  }
  &:hover, &:active {
    filter: invert();
  }
  &:active {
    transform: translate(-50%, 0) scale(.95);
    box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowMedium};
    transition-duration: .2s;
  }
  &.buy {
    font-size: 36px;
    line-height: 54px;
    text-align: center;
    bottom: 30%;
    left: 55%;
    padding: 36px;
    color: black;
    background: #fffc00;
  }
`

l.Deck = styled(CenteredFlex)`
  flex-direction: column;
  flex: 0 0 100%;
  height: 100%;
  width: 100%;
  position: relative;
  padding: 100px 0 90px;
  scroll-snap-align: start;

  & ${l.Image} {
    height: 90%;
    width: initial;
  }
`

l.CardRoot = styled(CenteredFlex)`
  height: 100%;
  flex: 0 0 100%;
  width: 100%;
  position: relative;
  z-index: 1;

  &.hide {
    visibility: hidden;
  }
`

l.Card = animated(styled.div`
  flex: 0 0 auto;
  height: 100%;
  display: flex;
  position: absolute;
  align-items: center;
  justify-content: center;
  user-select: none;
  cursor: pointer;
  touch-action: none;
  ${'' /* touch-action: pan-x pinch-zoom; */}

  & > * {
    transform: rotate(${p => p.spin}deg);
  }
`)

l.Title = styled(CenteredFlex)`
  position: absolute;
  top: 0;
  left: 0;
  height: 100px;
  width: 100%;
  font-size: 54px;
  font-family: big john;
  background: ${g.theme.eli};
  color: white;
  transition: all 1s ${c.Sexy};
  box-shadow: ${g.theme.shadowHeavy}, ${g.theme.sexyEdge};
  line-height: 70px;

  &.loading {
    height: 100%;
    color: ${g.theme.cal};
    @keyframes loading {
      100% {
        filter: hue-rotate(360deg) brightness(200%);
      }
    }
    animation-name: loading;
    animation-duration: 3s;
    animation-fill-mode: both;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  &::after {
    content: '';
    width: 100%;
    height: 6px;
    position: absolute;
    bottom: -6px;
    left: 0;
    background: ${g.theme.dan};
    box-shadow: ${g.theme.shadowVeryHeavy};
  }

  ${g.screen.medium`
    font-size: 36px;
  `}
`

l.LoadingText = styled(l.zon)`
  position: absolute;
  bottom: 108px;
  left: 0;
  width: 100%;
  text-align: center;
`

l.ActionZone = styled(CenteredFlex)`
  position: absolute;
  bottom: 18px;
  left: 0;
  height: 72px;
  width: 100%;
  color: white;
  padding: 0 12px;
  align-self: flex-end;
  transition: all 1s ${c.Sexy} ${p => p.delay}ms;

  &.hide {
    transform: scale(.95) translate(0, -108px);
    opacity: 0;
  }
`

l.BigAction = styled(CenteredFlex)`
  height: 100%;
  flex: 0 0 50%;
  max-width: 378px;
  font-size: 36px;
  background: ${g.theme.eli};
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy};
  font-family: aladin;
  cursor: pointer;
  margin: 0 12px;
  border-radius: 54px;
  color: white;
  position: relative;
  user-select: none;
  a {
    width: 100%;
    height: 100%;
    color: white;
    justify-content: center;
    align-items: center;
  }
`

l.TinyAction = styled(l.BigAction)`
  flex: 0 0 80px;
  padding-bottom: 9px;
  margin: 0;
  font-size: 54px;

`
