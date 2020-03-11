import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.SheetRoot = styled(g.FlexColumn)`
  justify-content: center;
  align-items: center;
  pointer-events: none;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1080;
  width: 100%;
  height: 100%;
  margin: 0 auto;

  &.open {
    pointer-events: all;
  }

  .bg {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,.81);
    cursor: pointer;
  }
  .sheet {
    position: relative;
    z-index: 1;
    padding: 27px 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    background: ${g.theme.eli};
    border-bottom-right-radius: 54px;
    border-bottom-left-radius: 54px;
    overflow-y: scroll;
    max-width: 95%;
    max-height: calc(100% - 108px);
    flex: 1 1 auto;
    box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy};

    ${g.screen.medmedsmall`
      padding: 27px 18px;
    `}
  }
`

l.Close = styled(g.Flex)`
  justify-content: center;
  align-items: center;
  font-size: 54px;
  font-family: aladin;
  height: 108px;
  width: 100%;
  bottom: 0;
  left: 0;
  color: white;
  transition: all .3s ${c.Sexy};
  cursor: pointer;
  pointer-events: none;
  text-shadow: 1px 1px rgba(0,0,0,.54);
  z-index: 1;
  flex: 1 1 auto;

  &:hover {
    transform: scale(1.1);
  }

  opacity: 0;
  transform: scale(0);
  .open & {
    @keyframes show {
      to {
        opacity: 1;
        transform: none;
        pointer-events: all;
      }
    }
    animation-name: show;
    animation-duration: .3s;
    animation-delay: .3s;
    animation-timing-function: ${c.Sexy};
    animation-fill-mode: both;
  }
`
