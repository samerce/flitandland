import styled, {css} from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.AbsoluteFlexFillParent)`
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1080;
  align-items: center;
  justify-content: center;
`

l.About = styled(g.Flex)`
  background: ${g.theme.ann};
  box-shadow: ${g.theme.shadowVeryHeavy}, ${g.theme.prettyFrame}, ${g.theme.sexyEdge};
  flex: 1;
  margin: 0 0 0 54px;
  padding: 27px;
  color: white;
  border-radius: 54px;
  font-size: 18px;
  line-height: 130%;
`

const ImageWidth = 400
l.PicRoot = styled(g.FlexColumn)`
  flex: 0 0 ${ImageWidth}px;
  justify-content: center;
  align-items: center;
`

l.Image = styled.div`
  flex: 0 0 auto;
  margin: 27px 0;
  img {
    box-shadow: ${g.theme.sexyEdge}, ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy};
    width: ${ImageWidth}px;
    border-radius: 4px;
  }
`

l.GetIt = styled(g.FlexColumn)`
  justify-content: center;
  align-items: center;
  flex: 0 0 100%;
  margin: 36px;
  max-width: 756px;
  padding: 0 0 54px;
`

l.AboutFormat = styled(g.Flex)`
  background: ${g.theme.ben};
  color: white;
  padding: 27px;
  margin: 18px 0;
  border-radius: 54px;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy};
`

l.GetItButtons = styled(g.Flex)`
  justify-content: center;
  align-items: center;
`

l.Or = styled.div`
  color: white;
  font-family: big john;
  margin: 0 9px;

`
const ButtonStyle = css`
  background: white;
  border-radius: 54px;
  border: none;
  color: black;
  font-family: aladin;
  font-size: 27px;
  user-select: none;
`

l.BarterBaby = styled(g.Flex)`
  ${ButtonStyle}
  padding: 12px 27px;
  cursor: pointer;
  height: 54px;

  &:hover {
    filter: invert();
  }
`

l.PickYourPrice = styled(g.FlexColumn)`
  align-items: center;
  position: relative;
`

l.Line = styled.div`
  height: 18px;
  width: 2px;
  background: white;
  transition: all .2s ${c.Sexy};
  position: absolute;
  top: 100%;
  transform: translate(0, -100%);

  &.show {
    transform: none;
  }
`

l.PriceInput = styled(g.TextInput)`
  ${ButtonStyle}
  color: ${g.theme.eli};
  width: 216px;
  padding: 12px 27px;
  height: 54px;
  z-index: 1;
  position: relative;

  &:hover, &:focus {
    filter: invert();
  }
`

l.Buy = styled(g.Flex)`
  ${ButtonStyle}
  flex: 0 0 auto;
  transition: all .3s ${c.Sexy};
  overflow: hidden;
  padding: 9px 18px;
  position: absolute;
  top: 100%;
  margin: 18px 0 0;
  cursor: pointer;
  transform: scale(0);
  opacity: 0;

  .idle & {
    @keyframes hide {
      transform: scale(0);
      opacity: 0;
    }
    animation-name: hide;
    animation-duration: .3s;
    animation-fill-mode: both;
  }
  .priceEntered &, .thinking &, .acceptOffer &, .rejectOffer &, .awaitPayment & {
    @keyframes show {
      100% {
        transform: none;
        opacity: 1;
      }
    }

    animation-name: show;
    animation-duration: .3s;
    animation-fill-mode: both;
    animation-delay: .1s;
  }
  .thinking &, .acceptOffer &, .rejectOffer &, .awaitPayment & {
    pointer-events: none;
    filter: invert();
  }
  &:hover {
    filter: invert();
  }
`

l.TabsRoot = styled(g.Flex)`
  justify-content: center;
  align-items: center;
  overflow: hidden;
  border-radius: 54px;
  width: 90%;
  box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowMedium};
`

l.Tab = styled(g.Flex)`
  flex: 0 0 ${p => 100 / p.numTabs}%;
  justify-content: center;
  align-items: center;
  padding: 3px 9px;
  color: black;
  background: white;
  font-size: 18px;
  transition: all .2s ${c.Sexy};
  cursor: pointer;
  font-family: aladin;

  &:hover {
    filter: invert();
  }
  &.active {
    filter: invert();
    cursor: default;
  }
  &:not(:last-child) {
    border-right: 1px solid black;
  }
`
