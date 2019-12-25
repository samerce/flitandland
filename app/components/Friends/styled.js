import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import {
  theme, screen, Flex
} from '../../global-styles'

const HeavyShadow = `3px 20px 40px ${theme.veryDark}`

export const Root = styled.div`
  position: relative;
  height: 100%;
  width: 100%;
`

export const Image = styled.img`
  width: 216px;
  filter: drop-shadow(2px 2px 20px #fae6f6)
    drop-shadow(4px 4px 10px #7a0b67)
    drop-shadow(1px 1px 0 white);
`

export const Friend = styled(Flex)`

`
