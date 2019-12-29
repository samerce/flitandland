import styled from 'styled-components'
import {
  theme, screen, FlexColumn, Flex,
} from '../../global-styles'
import * as c from '../../constants'

const BackgroundUrl = c.SRC_URL + 'commons/bursting-lq.jpg'

export const Root = styled.div`
  height: 100%;
  width: 100%;
  background: url("${BackgroundUrl}");
  background-repeat: repeat-y;
  background-size: cover;

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

    ${screen.medium`
      bottom: 20px;
      right: 20px;
    `}
  }
`

export const Content = styled(FlexColumn)`
  height: 100%;
  width: 100%;
  filter: blur(0);
  transition: all .5s;
  overflow-y: scroll;
  padding: 0 0 60px;
  background: linear-gradient(
    to bottom, rgba(255, 0, 237, 0.79) 0%, rgba(255, 0, 176, 0.8) 5%, rgba(201, 23, 173, 0.81) 50%, rgba(184, 0, 149, 0.8) 95%, rgba(193, 0, 133, 0.8) 100%
  );

  &.popupVisible {
    filter: blur(10px);
    ${'' /* transform: perspective(1080em) rotateX(1deg); */}
    transform: translate(0, -10px);
    transition: all .4s;
  }
`

export const Icons = styled(Flex)`
  justify-content: flex-end;
  align-items: center;
  margin: 10px;
`

export const Icon = styled.i`
  margin: 0 10px;
  font-size: 27px;
  cursor: pointer;
  text-shadow: ${theme.shadowHeavy};
  transition: all .3s;

  &:hover {
    color: ${theme.shelly};
  }
  ${'' /* &.fa-twitter {
    right: 60px;
  }
  &.fa-medium-m {
    right: 120px;
  } */}

  ${screen.medium`
  `}
`
