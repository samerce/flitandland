import styled from 'styled-components'
import { FlexColumn } from '../../global-styles'
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
  }
`

export const Content = styled(FlexColumn)`
  height: 100%;
  width: 100%;
  overflow-y: scroll;
  filter: blur(0);
  transition: all .5s ${EASE_OUT};

  &.popupVisible {
    filter: blur(10px);
    ${'' /* transform: perspective(1080em) rotateX(1deg); */}
    transform: translate(0, -10px);
    transition: all .4s ${EASE_OUT};
  }
`
