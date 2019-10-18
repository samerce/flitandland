import styled from 'styled-components'
import { FlexColumn } from '../../global-styles'
import {
  EASE_OUT, EASE_OUT_SINE
} from '../../constants'

export const Root = styled.div`
  height: 100%;
  width: 100%;
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
    transition: all .5s ${EASE_OUT};
  }
`
