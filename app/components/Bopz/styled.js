import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import {animated} from 'react-spring'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

const CenteredFlex = styled(g.Flex)`
  align-items: center;
  justify-content: center;
`

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
    flex-wrap: wrap;
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
      transition: all .2s ${c.Sexy};

      ${g.screen.medmedsmall`
        font-size: 54px;
      `}
      @media (max-width: 648px) {
        font-size: 78px;
      }
      @media (max-width: 534px) {
        font-size: 54px;
      }
      @media (max-width: 436px) {
        font-size: 36px;
      }
      @media (max-width: 354px) {
        font-size: 27px;
        margin: 18px;
      }
    }

    .book-link {
      display: flex;
      justify-content: center;
      flex: 0 0 100%;
      font-size: 36px;
      padding: 27px 12px;

      a {
        flex: 1 0 auto;
        max-width: 436px;
        padding: 18px 0;
        background: black;
        box-shadow: ${g.theme.sexyEdge};
        border-radius: 54px;
      }
    }
    .footer-brand {
      font-size: 108px;
      flex: 0 0 100%;
      color: ${g.theme.ann};
      font-size: 54px;
      text-align: center;
      padding: 27px 0 36px;

      ${g.screen.medium`
        font-size: 36px;
      `}
      ${g.screen.medsmall`
        font-size: 27px;
      `}
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
  border-radius: 5px;
  margin: 0 auto;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy},
    ${g.theme.prettyFrame};
  pointer-events: none;

  &, &&.portrait:not(.fullHeight) {
    width: 85%;
    height: initial;
  }
  &.fullHeight {
    width: initial;
    height: ${p => p.fullHeight}px;
  }
  ${g.screen.medsmall`
    &, &.fullHeight {
      width: 85%;
      height: initial;
    }
  `}

  &.revo {
    background: white;
  }
  &.cozy {
    width: 100%;
    box-shadow: none;

    &.fullHeight, &:not(.portrait) {
      width: initial;
      height: ${p => p.fullHeight * .8}px;
    }
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

l.arImage = styled.div`
  overflow: hidden;
  flex: 0 0 0;
  height: 0;
  width: 100%;
  padding-top: 56.26%;
  background: url("${p => p.src}");
  background-size: cover;
`

l.zon = styled.div`
  font-family: znikomit24;
  font-weight: 900;
  line-height: 130%;
`

l.yow = styled.span`
  font-family: slim joe;
  line-height: 130%;
`

l.woo = styled.span`
  font-family: big john;
  line-height: 130%;
`

l.al = styled.span`
  font-family: aladin;
  line-height: 130%;
`

l.Pot = styled(CenteredFlex)`
  font-size: 36px;
  line-height: 130%;
  font-family: aladin;
  padding: 54px;
  text-align: center;
  background: ${g.theme.dan};
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy};
  border-radius: 5px;
  color: white;
  max-width: 90%;
  max-height: 85%;
  flex: 1 0 auto;
  overflow: hidden;

  ${g.screen.medsmall`
    font-size: 18px;
    padding: 27px;
  `}
  ${g.screen.small`
    font-size: 15px;
  `}

  a {
    color: ${g.theme.cal};
    text-decoration: underline;
    &:hover {
      color: ${g.theme.ben};
    }
  }

  &.whimsy {
    width: 600px;
  }
  &.shock {
    flex: 1;
    background: ${g.theme.eli};
  }
  &.realness {
    background: #ff0070;
    width: 540px;
  }
  &.hollywood {
    background: #ff3b00;
    width: 432px;
  }
  &.evolution {
    width: 700px;
    background: #9e00ff;
  }
  &.scroll {
    flex-direction: column;
    width: 500px;

    img {
      position: absolute;
      top: 5%;
      left: 27px;
      height: 90%;
    }
  }
  &.flitandland {
    flex-direction: column;
    background: #00b2ff;
    width: 400px;
  }
  &.job {
    background: #7d00ff;
    width: 648px;
  }
  &.tough {
    width: 540px;
  }
  &.getpaid {
    flex-direction: column;
    background: #002fff;
    width: 460px;
  }
  &.classrooms {
    background: #0075ff;
    flex-direction: column;
    padding: 0;

    ${l.Video} {
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: none;
    }
  }
  &.flitpitch {
    font-family: crimson pro;
    font-size: 27px;
    background: white;
    color: black;
    width: 756px;
    text-align: left;

    ${g.screen.medsmall`
      font-size: 20px;
    `}
  }
  &.titleCard {
    font-family: big john;
    background: none;
    box-shadow: none;
    color: black;
  }
  &.pair {
    padding: 0;
    background: #8f00ff;
  }
  &.rovingart {
    background: ${g.theme.ben};
    width: 324px;
  }
  &.drag {
    background: ${g.theme.cal};
    padding: 0;
  }
  &.yoga {
    width: 540px;
    background: ${g.theme.dan};
  }
  &.exist {
    flex-direction: column;
    width: 440px;
    background: #ff0041;
  }
  &.volunteer {
    flex-direction: column;
    padding: 54px 27px;
    ${l.al}, ${l.zon} {
      font-size: 36px;
      margin-bottom: 18px;
    }
  }

  .txtbox {
    flex: 1;
    padding: 18px;
  }
  .img {
    flex: 1;
    overflow: hidden;
    position: relative;

    img {
      height: 100%;
      width: initial;
      box-shadow: none;
    }
  }
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

const DeckTitleHeight = {
  desktop: 100,
  medsmall: 85,
  small: 75,
}
l.Deck = styled(CenteredFlex)`
  flex-direction: column;
  flex: 0 0 100%;
  height: 100%;
  width: 100%;
  position: relative;
  padding: ${DeckTitleHeight.desktop}px 0;
  scroll-snap-align: start;
  scroll-snap-stop: always;
  user-select: none;

  & ${l.Image} {
    height: 90%;
    width: initial;
  }
  ${g.screen.medsmall`
    padding: ${DeckTitleHeight.medsmall}px 0;
  `}
  ${g.screen.small`
    padding: ${DeckTitleHeight.small}px 0;
  `}
`

l.CardRoot = styled(CenteredFlex)`
  height: 100%;
  flex: 0 0 100%;
  width: 100%;
  position: relative;
  z-index: 1;

  &.hide {
    visibility: hidden;
    transition: all .1s linear .3s;
  }
`

l.Card = animated(styled.div`
  flex: 0 0 auto;
  height: 100%;
  max-width: 90%;
  display: flex;
  position: absolute;
  align-items: center;
  justify-content: center;
  user-select: none;
  ${'' /* cursor: pointer; */}

  & > * {
    transform: rotate(${p => p.spin}deg);
  }
`)

l.Title = styled(CenteredFlex)`
  position: absolute;
  top: 0;
  left: 0;
  height: ${DeckTitleHeight.desktop}px;
  width: 100%;
  font-size: 54px;
  font-family: big john;
  background: ${g.theme.eli};
  color: white;
  transition: all 1s ${c.Sexy};
  box-shadow: ${g.theme.shadowHeavy}, ${g.theme.sexyEdge};
  line-height: 70px;
  user-select: none;

  animation-name: colorPlay;
  animation-duration: 20s;
  animation-fill-mode: both;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;

  &.loading {
    height: 100%;
    color: ${g.theme.ann};
    animation-duration: 3s;
    text-shadow: 1px 1px rgba(0,0,0,.5);
  }

  &::after {
    content: '';
    width: 100%;
    height: 6px;
    position: absolute;
    bottom: -6px;
    left: 0;
    background: ${g.theme.dan};
    box-shadow: ${g.theme.shadowVeryHeavy}, ${g.theme.sexyEdge};
  }

  ${g.screen.large`
    font-size: 36px;
  `}
  ${g.screen.medium`
    font-size: 27px;
  `}
  ${g.screen.medsmall`
    font-size: 18px;
    height: ${DeckTitleHeight.medsmall}px;
  `}
  ${g.screen.small`
    font-size: 15px;
    height: ${DeckTitleHeight.small}px;
  `}
`

l.OutNow = styled(CenteredFlex)`
  position: absolute;
  top: ${DeckTitleHeight.desktop - 27}px;
  width: 158px;
  height: 158px;
  right: 12%;
  background: #1cf71f;
  color: black;
  font-size: 18px;
  margin: 6px 0;
  z-index: 100;
  border-radius: 100%;
  flex-direction: column;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy};
  cursor: pointer;

  transform: rotate(0) scale(0);
  opacity: 0;
  transition: all .5s ease-in-out ${p => p.delay + 1000}ms;
  &.show {
    opacity: 1;
    transform: rotate(744deg) scale(1);
  }

  ${g.screen.large`
    right: 18px;
  `}
  ${g.screen.medsmall`
    top: 59px;
    right: 9px;
    width: 94px;
    height: 94px;
    font-size: 12px;
  `}
  ${g.screen.small`
    top: 49px;
    width: 74px;
    height: 74px;
    font-size: 9px;
  `}
`

l.LoadingText = styled.div`
  position: absolute;
  bottom: 108px;
  left: 0;
  width: 100%;
  text-align: center;
  font-family: big john;
  font-weight: 900;
  font-size: 18px;
  color: ${g.theme.ann};
  text-shadow: 1px 1px rgba(0,0,0,.5);
  user-select: none;
`

const ActionsHeight = 72
l.ActionZone = styled(CenteredFlex)`
  position: absolute;
  bottom: 18px;
  left: 0;
  height: ${ActionsHeight}px;
  width: 100%;
  color: white;
  padding: 0 12px;
  align-self: flex-end;
  transition: all 1s ${c.Sexy} ${p => p.delay}ms;

  &.hide {
    transform: scale(.95) translate(0, -108px);
    opacity: 0;
  }
  ${g.screen.medmedsmall`
    bottom: 12px;
    height: 60px;
  `}
`

l.BigAction = styled(CenteredFlex)`
  height: 100%;
  flex: 0 0 50%;
  max-width: 378px;
  font-size: 36px;
  background: ${g.theme.eli};
  background: ${g.theme.gradient};
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy};
  font-family: aladin;
  cursor: pointer;
  margin: 0 12px;
  border-radius: 54px;
  color: white;
  position: relative;
  user-select: none;
  text-shadow: 1px 1px rgba(0,0,0,.54);
  transition: all .3s ${c.Sexy};

  &:active {
    transform: scale(.85);
  }

  a {
    width: 100%;
    height: 100%;
    justify-content: center;
    align-items: center;
  }

  ${g.screen.medsmall`
    font-size: 27px;
  `}
  ${g.screen.medmedsmall`
    font-size: 21px;
  `}
  ${g.screen.small`
    font-size: 18px;
  `}

  animation-name: colorPlay;
  animation-duration: 20s;
  animation-fill-mode: both;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
`

l.TinyAction = styled(l.BigAction)`
  flex: 0 0 ${ActionsHeight}px;
  padding-bottom: 7px;
  margin: 0;
  font-size: 54px;
  border-radius: 100%;

  ${g.screen.medmedsmall`
    flex: 0 0 60px;
    padding-bottom: 4px;
  `}
`
