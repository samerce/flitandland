import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import {
  theme, screen, Flex
} from '../../global-styles'

const HeavyShadow = `3px 20px 40px ${theme.veryDark}`

export const Root = styled.div`
  width: 100%;
`

const ShadowColor = '#f2b8e8'/* '#7d3175'*/
const BorderColor = alpha(.6, '#fae6f6')
export const Title = styled.div`
  width: 100%;
  background: ${alpha(.8, '#fae6f6')};
  text-align: center;
  margin: 100px 0 0;
  font-family: znikomit24;
  font-size: 62px;
  ${'' /* background: #fbeffa; */}
  ${'' /* border-radius: 5px; */}
  border-top: 1px solid ${BorderColor};
  border-bottom: 1px solid ${BorderColor};
  box-shadow: 0 0 0 1px ${alpha(.7, ShadowColor)};
  padding: 55px 50px 40px;
  color: #7a0b67; /*#ee6be1;*/
  text-shadow: 0 0 ${lighten(.2, ShadowColor)}, 1px 1px ${ShadowColor};
  filter: drop-shadow(2px 2px 10px ${ShadowColor});
  user-select: none;
  ${'' /* text-shadow: 1px 1px 1px ${ShadowColor}, 2px 2px 1px ${ShadowColor}, 3px 3px 1px ${ShadowColor}, 4px 4px 1px ${ShadowColor}, 5px 5px 1px ${ShadowColor}, 6px 6px 1px ${ShadowColor}, 7px 7px 1px ${ShadowColor}, 8px 8px 1px ${ShadowColor},
  1px 1px 2px ${ShadowColor}, 2px 2px 2px ${ShadowColor}, 3px 3px 2px ${ShadowColor}, 4px 4px 2px ${ShadowColor}, 5px 5px 2px ${ShadowColor}, 6px 6px 2px ${ShadowColor}, 7px 7px 2px ${ShadowColor}, 8px 8px 2px ${ShadowColor}; */}
  ${'' /* box-shadow: 3px 3px 30px black,
    0 0 0 1px ${ShadowColor},
    0 0 0 2px rgba(255,255,255,.5),
    0 0 0 3px ${darken(.2, ShadowColor)}; */}
`