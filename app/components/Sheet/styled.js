import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.SheetRoot = styled(g.AbsoluteFlexFillParent)`
  justify-content: center;
  pointer-events: none;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1080;

  &.open {
    pointer-events: all;
  }

  .bg {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.54);
  }
  .sheet {
    position: relative;
    z-index: 1;
    padding: 54px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    background: ${g.theme.eli};
    border-bottom-right-radius: 54px;
    border-bottom-left-radius: 54px;
    overflow-y: scroll;
    height: calc(100% - 54px);
  }
`
