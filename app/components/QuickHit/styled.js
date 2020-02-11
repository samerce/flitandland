import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.FlexColumn)`
  width: 100%;
  height: 100%;
`

l.Text = styled(g.Flex)`
  font-family: big john;
  color: white;
  justify-content: center;
  flex: 1 0 auto;
  align-items: center;
  padding-top: 27px;

  @keyframes in {
    100% {
      transform: none;
    }
  }

  &, & > div {
    transform: translate(100%);
    animation-name: in;
    animation-duration: .5s;
    animation-fill-mode: both;
    animation-timing-function: ${c.Sexy};
  }
  & > div {
    animation-delay: .1s;
  }
`

l.Time = styled(l.Text)`
  background: #C004D9;
  font-size: 108px;
  width: 100%;
`

l.For = styled(l.Text)`
  font-family: slim joe;
  font-size: 27px;
  background: #AB05F2;
  flex: 0 0 54px;
  padding: 0;

  animation-delay: .1s;
  div {
    animation-delay: .2s;
  }
`

l.Ott = styled(l.Text)`
  font-size: 108px;
  background: #6D0FF2;
  animation-delay: .2s;
  div {
    animation-delay: .3s;
  }
`

l.Real = styled(l.Text)`
  padding: 0;
  font-family: znikomit24;
  font-size: 108px;
  background: #3316F2;
  animation-delay: .3s;
  div {
    animation-delay: .4s;
  }
`

l.To = styled(l.For)`
  font-family: slim joe;
  font-size: 18px;
  background: #0D0D0D;
  animation-delay: .4s;
  div {
    animation-delay: .5s;
  }
`

l.Shock = styled(l.Text)`
  font-size: 108px;
  background: #C004D9;
  animation-delay: .5s;
  div {
    animation-delay: .6s;
  }
`

l.The = styled(l.For)`
  font-family: slim joe;
  font-size: 18px;
  background: #AB05F2;
  animation-delay: .6s;
  div {
    animation-delay: .7s;
  }
`

l.Conscience = styled(l.Text)`
  padding: 0;
  font-size: 108px;
  font-family: znikomit24;
  background: #6D0FF2;
  animation-delay: .7s;
  div {
    animation-delay: .8s;
  }
`

l.Nation = styled(l.Text)`
  font-family: slim joe;
  font-size: 54px;
  flex: 0 0 108px;
  background: #3316F2;
  animation-delay: .8s;
  div {
    animation-delay: .9s;
  }
`
