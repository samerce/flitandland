import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.FlexColumn)`
  width: 100%;

  .slackInput {
    overflow: hidden;
    visibility: hidden;
    pointer-events: none;
    height: 0;
    margin: 0;
    padding: 0;
  }
`

l.ShippingRoot = styled(g.FlexColumn)`
`

l.ShippingInput = styled(g.TextInput)`
`

l.PayPalButtons = styled(g.Flex)`
  margin: 15px 0 0;

  .paypal-button-container {
    display: flex;
    flex-direction: column-reverse;
  }
  .paypal-button-number-1 {
    margin-bottom: 5px;
  }
  .paypal-buttons {
    margin: 0 auto;
  }
`
