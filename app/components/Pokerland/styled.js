import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.Flex)`
  width: 100%;
  display: none;

  &.show {
    display: flex;
  }
`

l.Row = styled(g.Flex)`

`

l.Decor = styled(g.FlexColumn)`

`

l.Docent = styled.img`
  width: 100%;
`

l.Cards = styled.img`
  width: 100%;

`

l.Content = styled(g.Flex)`

`
