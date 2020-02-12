import styled from 'styled-components'
import * as g from '../../global-styles'
import * as c from '../../constants'

export const Root = styled.div`
  height: 100%;
  width: 100%;
  overflow-x: hidden;
  background: rgba(216, 4, 202, 1);
  background: url("${c.SRC_URL + 'commons/yeshurricane.jpg'}");
  background-size: cover;
  background-attachment: fixed;

  .returnToTop {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 60px;
    transform: scale(0) rotate(360deg);
    filter: blur(5px);
    pointer-events: none;
    transition: all .3s;

    &.show {
      transform: scale(.98) rotate(-180deg);
      filter: none;
      pointer-events: all;
    }

    ${g.screen.medium`
      bottom: 20px;
      right: 20px;
    `}
  }
`

export const Content = styled(g.FlexColumn)`
  height: 100%;
  width: 100%;
  filter: blur(0);
  transition: all .5s;
  overflow-y: scroll;
  padding: 0 0 60px;

  &.popupVisible {
    filter: blur(10px);
    ${'' /* transform: perspective(1080em) rotateX(1deg); */}
    transform: translate(0, -10px);
    transition: all .4s;
  }
`

export const Icons = styled(g.Flex)`
  justify-content: flex-end;
  align-items: center;
  margin: 20px 10px;
`

export const Icon = styled.i`
  margin: 0 10px;
  font-size: 27px;
  cursor: pointer;
  text-shadow: ${g.theme.shadowHeavy};
  transition: all .3s;

  &:hover {
    color: ${g.theme.shelly};
  }
  ${'' /* &.fa-twitter {
    right: 60px;
  }
  &.fa-medium-m {
    right: 120px;
  } */}

  ${g.screen.medium`
  `}
`
