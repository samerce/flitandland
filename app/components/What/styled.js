import styled from 'styled-components'
import {
  theme, Flex, MatrixItem as aMatrixItem, Button as aButton,
} from '../../global-styles'

export const Root = styled.section`
  text-align: center;
  background: linear-gradient(to bottom, #27b6e3 0%, #25e27c 50%, #7233e8 95%, #996fe8 100%);

  .image-gallery {
    border: 20px solid white;
    box-shadow: ${theme.shadowVeryHeavy};
    margin: 20px auto;
    width: ${p => p.gallerySize.width}px;
    height: ${p => p.gallerySize.height}px;
    flex: 0 0 ${p => p.gallerySize.width}px;
    cursor: pointer;
  }
  .image-gallery-content {
    border: 2px solid ${theme.shellyDark};
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
      height: ${p => p.gallerySize.height}px;
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

export const Commercial = styled.iframe`
  border-radius: 20px;
  border: 1px solid white;
  box-shadow: ${theme.shadowVeryHeavy};
  margin: 20px 0 0;
  width: ${p => p.size.width}px;
  height: ${p => p.size.height}px;
`

export const PeopleImage = styled.img`
  margin: 60px auto;
  width: 50%;
  display: block;
`

export const Button = styled(aButton)`
  margin: 100px auto 40px;
`
