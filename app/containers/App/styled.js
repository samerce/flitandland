import styled from 'styled-components'
import * as g from '../../global-styles'
import * as c from '../../constants'

export const Root = styled.div`
  height: 100%;
  width: 100%;
  overflow-x: hidden;
  background: white;
  touch-action: pan-y pinch-zoom;
  scroll-snap-type: y mandatory;
  scroll-snap-stop: always;
`
