import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.Root = styled(g.FlexColumn)`
  width: 100%;

  .paypal-button-container {
    display: flex;
    flex-direction: column-reverse;
  }
  .paypal-button-number-1 {
    margin-bottom: 5px;
  }
  .paypal-buttons {
    margin: 15px auto 0;
  }

  * {
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  fieldset {
    margin: 0;
    padding: 0;
    border: 0;
  }

  #form-container {
    position: relative;
    width: 380px;
    margin: 12px auto;
    background: white;
  }

  #sq-card {
    color: white;
  }

  .sq-input {
    color: white;
  }

  /* Customize the "Pay with Credit Card" button */
  .button-credit-card {
    width: 100%;
    height: 56px;
    margin-top: 10px;
    background: #4A90E2;
    border-radius: 6px;
    cursor: pointer;
    display: block;
    color: #FFFFFF;
    font-size: 20px;
    line-height: 24px;
    font-weight: 700;
    letter-spacing: 0;
    text-align: center;
    text-transform: uppercase;
    -webkit-transition: background .2s ease-in-out;
       -moz-transition: background .2s ease-in-out;
        -ms-transition: background .2s ease-in-out;
            transition: background .2s ease-in-out;
  }

  .button-credit-card:hover {
    background-color: #4281CB;
  }
`

l.ShippingRoot = styled(g.FlexColumn)`
`

l.ShippingInput = styled(g.TextInput)`
  font-size: 16px;
  background: white;
  color: ${g.theme.susanDark};
  width: 80%;
`

// l.SizeOptionsRoot = Flex.extend`
//   width: 100%;
//   margin: 20px 0;
//   flex-wrap: wrap;
// `

// l.SizeOption = Boto.extend`
//   flex: 1 0 auto;
//   max-width: 300px;
//   margin: 0 10px;
// `

l.PickArtForm = styled(g.FlexColumn)`
  flex-wrap: wrap;
  align-items: center;
  margin: 20px 0 0;
`

l.TotalRoot = styled(g.FlexColumn)`
  max-width: 500px;
  width: 100%;
`

l.Itemization = styled(g.FlexColumn)`
  margin: 10px 0 0;
  z-index: 2;
  border-radius: 10px;
  background: ${g.theme.main};
  box-shadow: ${g.theme.shadowVeryHeavy}, ${g.theme.sexyEdge};

  span {
    font-size: 22px;
    color: ${g.theme.semiWhite};
    flex: 0 0 auto;
    padding-left: 16px;
    font-family: alice;
  }

  .checkout-thanking & {
    flex: 0 0 0;
    overflow: hidden;
    opacity: 0;
    transition: all .3s ${c.Sexy};
  }
`

l.ItemName = styled(g.Body)`
  margin: 0;
  align-items: center;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
  padding: 5px 0;
  border: 0;
  box-shadow: none;
`

l.ShippingRoot = styled(g.FlexColumn)`
  flex: 1;
  color: ${g.theme.veryDark};
  font-size: 28px;
  font-family: alice;
  background: ${g.theme.veryLight};
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  width: 100%;
  align-items: center;
  position: relative;
  padding: 20px 0 10px;

  &.inputs {
    background: none;
    border-radius: none;
    padding: 0;
  }
`

l.ShippingPrice = styled(g.Flex)`
  color: white;
  line-height: 28px;
`

l.ShippingByline = styled(g.Flex)`
  font-size: 16px;
  color: ${g.theme.veryDark};
`

l.PlusSign = styled.i`
  width: 30px;
  height: 30px;
  line-height: 28px;
  font-size: 16px;
  color: white;
  background: ${g.theme.flikLight};
  border-radius: 100%;
  border: 1px solid ${g.theme.flik};
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
`

l.PriceRoot = styled(g.FlexColumn)`
  flex: 1;
  position: relative;
`

l.PriceInput = styled(g.TextInput)`
  flex: 1;
  margin: 0;
  width: 100%;
  padding: 20px 0;
  font-size: 28px;

  .checkout-thanking & {
    pointer-events: none;
  }
`

l.CheckoutWidget = styled(g.Button)`
  position: relative;
  flex: 0 0 0;
  flex-direction: column;
  align-items: center;
  padding: 22px 0 0;
  width: 100%;
  align-self: center;
  transform: translate(0, -100%);
  font-size: 24px;
  opacity: 0;
  z-index: 1;
  box-shadow: ${g.theme.shadowHeavy};
  background: white;
  border-color: ${g.theme.tweetLight};

  .checkout-offering &, .checkout-closing &, .checkout-thanking & {
    opacity: 1;
    transform: translate(0, -12px);
    flex: 0 0 180px;
  }

  .checkout-closing &, .checkout-closing &:hover {
    background: white;
    border-color: ${g.theme.veryLight};
    width: 150%;
    color: ${g.theme.veryLight};
    padding: 22px 0 0;
    cursor: default;
    flex: 0 0 auto;

    ${g.screen.medium`
      width: ${window.innerWidth - 100}px;
    `}
  }
  .checkout-thanking & {
    background: ${g.theme.veryLight};
    color: ${g.theme.veryDark};
    pointer-events: none;
    flex: 0 0 159px;
    padding: 20px 20px 15px;
    width: 395px;
    text-align: left;

    ${g.screen.medium`
      width: ${window.innerWidth - 100}px;
      font-size: 18px;
      flex: 0 0 125px;
    `}
  }
`

l.TotalText = styled(g.Flex)`
  color: white;
  border: 2px solid ${g.theme.flikLight};
  border-radius: 100%;
  transition: all .3s ${c.Sexy};
  flex: 0 0 90px;
  width: 90px;
  margin: 5px 0;
  align-items: center;
  justify-content: center;
  background: ${g.theme.flik};
  font-size: 28px;

  ${l.CheckoutWidget}:hover &, .checkout-closing & {
    background: ${g.theme.flikLight};
    border-color: ${g.theme.flik};
    color: white;
  }
  .checkout-thanking & {
    flex: 0 0 0;
    overflow: hidden;
    margin: 0;
    opacity: 0;
  }
`

l.GetItText = styled(g.Flex)`
  transition: right .3s ${c.Sexy};
  flex: 1;

  .checkout-closing & {
    color: ${g.theme.veryLight};
    font-size: 28px;
  }
`

l.CheckoutRoot = styled(g.FlexColumn)`
  flex: 0 0 0;
  overflow: hidden;
  transition: all .3s ${c.Sexy};
  width: 100%;
  align-self: center;
  opacity: 0;
  margin: 15px 0 0;

  .checkout-closing & {
    flex: 1;
    opacity: 1;

    #paypalButtons iframe {
      padding: 0 20px;
    }
  }
`
