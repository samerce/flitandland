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
  visibility: hidden;
  transition: visibility;
  transition-delay: 1s;

  &.open {
    pointer-events: all;
    visibility: visible;
    transition-delay: 0s;
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
    padding: 18px 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    background: ${g.theme.eli};
    border-bottom-right-radius: 27px;
    border-bottom-left-radius: 27px;
    overflow-y: scroll;
    max-width: 99%;
    max-height: calc(100% - 94px);
    flex: 0 0 auto;
    box-shadow: ${g.theme.sexyEdge}, ${g.theme.shadowVeryHeavy};

    ${g.screen.medmedsmall`
      padding: 27px 18px;
    `}
    ${g.screen.medsmall`
      max-height: calc(100% - 54px);
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
  flex: 1;

  &:hover {
    transform: scale(1.1);
  }

  opacity: 0;
  transform: scale(0);
  .open & {
    @keyframes showSheetClose {
      to {
        opacity: 1;
        transform: none;
      }
    }
    animation-name: showSheetClose;
    animation-duration: .3s;
    animation-delay: .3s;
    animation-timing-function: ${c.Sexy};
    animation-fill-mode: both;
  }

  ${g.screen.large`
    font-size: 36px;
  `}
  ${g.screen.medsmall`
    font-size: 27px;
  `}
`
