import styled from 'styled-components'
import {
  theme, screen, FlexColumn
} from '../../global-styles'
import {
  EASE_OUT, EASE_OUT_SINE
} from '../../constants'

export const Root = styled.div`
  height: 100%;
  width: 100%;

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
  height: ${window.innerHeight}px;
  height: 100%;
  ${'' /* margin-bottom: 60px; */}
  width: 100%;
  filter: blur(0);
  transition: all .5s;
  overflow-y: scroll;
  background: linear-gradient(to bottom, #ff00ed 0%, #ff00b0 5%, #c917ad 50%, #b80095 95%, #c10085 100%);

  &.popupVisible {
    filter: blur(10px);
    ${'' /* transform: perspective(1080em) rotateX(1deg); */}
    transform: translate(0, -10px);
    transition: all .4s;
  }
`

export const Icon = styled.i`
  position: fixed;
  bottom: 30px;
  left: 30px;
  font-size: 150%;
  cursor: pointer;
  text-shadow: ${theme.shadowVeryHeavy};
  transition: all .3s;

  &:hover {
    color: ${theme.shelly};
  }

  ${screen.medium`
    bottom: 20px;
    left: 20px;
  `}
`
