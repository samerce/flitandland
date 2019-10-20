import styled from 'styled-components'
import {transparentize} from 'polished'
import {
  theme, FlexColumn
} from '../../global-styles'

export const Root = styled.div`
  .image-gallery {
    border: 20px solid white;
    box-shadow: ${theme.shadowVeryHeavy};
    margin: 40px auto;
    width: ${p => p.size.width}px;
    height: ${p => p.size.height}px;
    max-height: ${p => p.size.height}px;
    flex: 0 0 ${p => p.size.width}px;
    cursor: pointer;
  }
  .image-gallery-content {
    border: 2px solid ${transparentize(.5, theme.shellyDark)};
    width: 100%;
    height: 100%;
    overflow: hidden;

    &.fullscreen .image-gallery-slide {
      line-height: ${p => p.screenHeight}px;

      &.biggerHeight img {
        height: ${p => p.screenHeight}px;
      }
    }
  }
  .image-gallery-slide-wrapper {
    width: 100%;
    height: 100%;
  }
  .image-gallery-slide {
    background: black;

    &.biggerHeight img {
      width: initial;
      height: ${p => p.size.height}px;
    }
  }
  .image-gallery-right-nav, .image-gallery-left-nav {
    height: 100%;
    font-size: 32px;
  }
  .image-gallery-right-nav::before {
    content: "⇝";
    text-shadow: 1px 1px 0px black, 0 0 10px black, 0 0 20px black, 0 0 30px black, 0 0 40px black, 0 0 50px black;
  }
  .image-gallery-left-nav::before {
    content: "⇜";
    text-shadow: 1px 1px 0px black, 0 0 10px black, 0 0 20px black, 0 0 30px black, 0 0 40px black, 0 0 50px black;
  }
`
