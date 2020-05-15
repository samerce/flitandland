import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.FlexColumn)`
  position: relative;
  width: 100%;
  height: 100%;
  overflow-x: hidden;
  background: white;
  touch-action: pan-y pinch-zoom;
  scroll-snap-type: y mandatory;
  scroll-snap-stop: always;
  color: black;
`

l.Svelte = styled.div`
  position: absolute;
  width: 200%;
  height: 300%;
  background: white;
  border: 2px solid black;
  box-shadow: 0 0 0 3px white, 0 0 20px rgba(0,0,0,.5);
  transform: rotate(-5deg) translate(-75px, -210px);
  align-self: flex-start;

  &.opp {
    transform: rotate(-5deg) translate(75px, -10px);
  }
`

l.Header = styled(g.AbsoluteFlex)`
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100px;
  flex-direction: column;
  padding: 54px;
  justify-content: center;
`

l.Title = styled.div`
  font-family: metrophobic;
  font-size: 54px;
  margin-bottom: 6px;
  z-index: 1;
`

l.Subtitle = styled.div`
  font-size: 17px;
  letter-spacing: 1px;
  z-index: 1;
  font-weight: 100;
  padding-left: 2px;
`

l.Page = styled(g.Flex)`
  background-attachment: fixed;
  background-size: cover;
  background-image: url("${p => p.image}");
  width: 100%;
  height: ${window.innerHeight}px;
  flex: 0 0 100%;
  align-items: center;
  justify-content: center;
  scroll-snap-align: start;
  scroll-snap-stop: always;
  align-items: flex-end;
  padding: 200px;
`

l.PageText = styled(g.FlexColumn)`
  width: 100%;
  padding: 12px;
  align-items: center;
  justify-content: center;
  color: white;

`

l.little = styled.div`
  font-family: crimson pro;
  font-size: 27px;
  font-style: italic;
  text-shadow: 1px 1px rgba(0,0,0.5);
  filter: drop-shadow(0 0 15px rgba(0,0,0.5));
  transform: rotate(-5deg);
`

l.big = styled.div`
  font-family: crimson pro;
  font-size: 54px;
  text-transform: uppercase;
`

l.ActionZone = styled(g.AbsoluteFlex)`
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 108px;
  padding: 54px;
  justify-content: flex-end;
`

l.NavButton = styled(g.Button)`
  width: 80px;
  height: 80px;
  align-items: center;
  border-radius: 100%;
  background: white;
  border: 2px solid black;
  box-shadow: 0 0 0 3px white, 0 0 15px rgba(0,0,0.5);
  position: fixed;
  left: 18px;
`

l.PrevButton = styled(l.NavButton)`
  bottom: 98px;
`

l.NextButton = styled(l.NavButton)`
  bottom: 9px;
`

l.ActionButton = styled.div`
  margin: -30px 0 0;
  z-index: 1;
  font-size: 36px;
  font-weight: 900;

`

l.Footer = styled(g.FlexColumn)`
  padding: 54px;
  position: relative;
  z-index: 1;
  background: black;
  color: white;
  scroll-snap-align: start;
  scroll-snap-stop: always;
  line-height: 130%;
  width: 100%;
  flex: 0 0 100%;
  justify-content: center;
`

l.Name = styled.div`
  font-family: metrophobic;
  font-size: 54px;
  line-height: 130%;
`

l.Contact = styled.div`
  font-size: 27px;
  line-height: 130%;
  font-family: lora;
`
