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
  ${'' /* text-shadow: 1px 1px white, 2px 2px white, 3px 3px white; */}
  justify-content: center;
  flex: 1 0 auto;
  align-items: center;
  padding-top: 18px;
  font-size: 108px;

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

  ${g.screen.medium`
    font-size: 54px;
    padding-top: 12px;
  `}
  ${g.screen.medsmall`
    font-size: 36px;
  `}
  ${g.screen.small`
    font-size: 27px;
  `}
`

l.Time = styled(l.Text)`
  background: ${g.theme.ann};
  font-family: slim joe;
  padding-top: 12px;
`

l.For = styled(l.Text)`
  font-family: slim joe;
  font-size: 27px;
  background: ${g.theme.ben};
  flex: 0 0 54px;
  padding: 0;

  animation-delay: .1s;
  div {
    animation-delay: .2s;
  }
  ${g.screen.medium`
    padding: 0;
  `}
`

l.Ott = styled(l.Text)`
  background: ${g.theme.cal};
  animation-delay: .2s;
  div {
    animation-delay: .3s;
  }
`

l.Real = styled(l.Text)`
  padding: 0;
  font-family: znikomit24;
  background: ${g.theme.dan};
  animation-delay: .3s;
  div {
    animation-delay: .4s;
  }
`

l.To = styled(l.For)`
  font-family: slim joe;
  background: ${g.theme.eli};
  animation-delay: .4s;
  div {
    animation-delay: .5s;
  }
  ${g.screen.medium`
    padding: 0;
  `}
`

l.Shock = styled(l.Text)`
  background: ${g.theme.ann};
  animation-delay: .5s;
  div {
    animation-delay: .6s;
  }
`

l.The = styled(l.For)`
  font-family: slim joe;
  background: ${g.theme.ben};
  animation-delay: .6s;
  div {
    animation-delay: .7s;
  }
  ${g.screen.medium`
    padding: 0;
  `}
`

l.Conscience = styled(l.Text)`
  padding: 0;
  font-family: znikomit24;
  background: ${g.theme.cal};
  animation-delay: .7s;
  div {
    animation-delay: .8s;
  }
  ${g.screen.medium`
    padding: 0;
  `}
`

l.Of = styled(l.The)`
  background: ${g.theme.dan};
  animation-delay: .8s;
  div {
    animation-delay: .9s;
  }
`

l.Nation = styled(l.Time)`
  background: ${g.theme.eli};
  animation-delay: .9s;
  div {
    animation-delay: 1s;
  }
`
