import styled from 'styled-components'
import {transparentize as alpha, darken, lighten} from 'polished'
import * as g from '../../global-styles'
import * as c from '../../constants'

const l = {}
export default l

l.CheckoutWidget = styled(g.Flex)`
  position: relative;
  flex-direction: column;
  align-items: center;
  padding: 22px 0 0;
  width: 100%;
  align-self: center;
  font-size: 24px;
  z-index: 1;
  max-width: 540px;

  opacity: 1;
  transform: translate(0, -12px);
  flex: 0 0 180px;

  width: 150%;
  color: ${g.theme.veryLight};
  padding: 22px 0 0;
  cursor: default;
  flex: 0 0 auto;

  ${g.screen.medium`
    width: 100%;
  `}

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

    ${g.screen.medium`
      width: 100%;
    `}
  }

  #sq-card {
    color: white;
    background: white;
    border-radius: 6px;
  }
  .sq-card-details {
    color: rgba(0,0,0,.6) !important;
    margin-top: 6px;
    &:after {
      content: ' above'
    }
    display: none;
  }

  .sq-input {
    color: white;
  }

  /* Customize the "Pay with Credit Card" button */
  .button-credit-card {
    width: 100%;
    height: 56px;
    margin-top: 10px;
    background: black;
    border-radius: 6px;
    cursor: pointer;
    display: block;
    color: white;
    font-size: 20px;
    line-height: 24px;
    font-weight: 700;
    letter-spacing: 0;
    text-align: center;
    text-transform: uppercase;
    font-family: aladin;
    border: none;
    box-shadow: ${g.theme.sexyEdge};
    -webkit-transition: background .2s ease-in-out;
       -moz-transition: background .2s ease-in-out;
        -ms-transition: background .2s ease-in-out;
            transition: background .2s ease-in-out;
  }

  .button-credit-card:hover {
    filter: invert();
  }
`

l.Image = styled.div`
  flex: 0 0 auto;
  margin: 27px 0;
  img {
    box-shadow: ${g.theme.sexyEdge}, ${g.theme.prettyFrame}, ${g.theme.shadowVeryHeavy};
    height: 216px;
    border-radius: 4px;
  }
`

l.Title = styled.div`
  font-family: slim joe;
  font-size: 54px;
  color: white;
  margin: 18px 0;

  ${g.screen.medsmall`
    font-size: 27px;
  `}
  ${g.screen.small`
    font-size: 22px;
  `}
`

l.TotalRoot = styled(g.FlexColumn)`
  max-width: 500px;
  width: 100%;
`

l.ShippingRoot = styled(g.Flex)`
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
  flex-wrap: wrap;
  justify-content: center;

  &.inputs {
    background: none;
    border-radius: none;
    padding: 0;
  }
`

l.ShippingInput = styled(g.TextInput)`
  font-size: 16px;
  background: white;
  color: ${g.theme.susanDark};
  border-radius: 54px;
  margin: 9px 0;
  border: none;
  box-shadow: ${g.theme.sexyEdge};

  &.name, &.email, &.address {
    flex: 0 0 99%;
  }
  &.city {
    flex: 0 0 30%;
    margin-right: 9px;
  }
  &.state, &.postcode {
    flex: 0 0 30%;
  }
  &.state {
    margin-right: 9px;
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
  background: black; /*${g.theme.flik};*/
  font-size: 28px;

  box-shadow: ${g.theme.sexyEdge};
  color: white;
  .checkout-thanking & {
    flex: 0 0 0;
    overflow: hidden;
    margin: 0;
    opacity: 0;
  }
`

l.CheckoutRoot = styled(g.FlexColumn)`
  overflow: hidden;
  transition: all .3s ${c.Sexy};
  width: 100%;
  align-self: center;
  margin: 15px 0 0;
  flex: 1;
`
