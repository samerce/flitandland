import styled from 'styled-components';
import { theme, Flex, AbsoluteFlexFillParent } from '../../global-styles';

export const Root = styled(Flex)`
  width: 100%;
  height: 100%;
  flex-wrap: wrap;
`;

const QuadBorder = `1px solid ${theme.main}`;
export const Quad = styled(Flex)`
  flex: 0 0 50%;
  height: 50%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;

  &.topLeft {
    border-right: ${QuadBorder};
    border-bottom: ${QuadBorder};
  }
  &.topRight {
    border-left: ${QuadBorder};
    border-bottom: ${QuadBorder};
  }
  &.bottomLeft {
    border-top: ${QuadBorder};
    border-right: ${QuadBorder};
  }
  &.bottomRight {
    border-top: ${QuadBorder};
    border-left: ${QuadBorder};
  }
`;

export const QuadImage = styled.img`
  position: absolute;
  height: 100%;
`;

export const QuadTitle = styled.div`
  font-size: 48px;
  text-transform: uppercase;
  z-index: 1;
  color: white;
`;

export const QuadSubtitle = styled.div`
  font-size: 24px;
  letter-spacing: 1px;
  z-index: 1;
  color: white;
`;

export const CenterRoot = styled(AbsoluteFlexFillParent)`
  align-items: center;
  justify-content: center;
`;

const getSize = screenWidth => Math.min(window.innerWidth, 400);
export const Bubble = styled(Flex)`
  border-radius: 100%;
  border: ${QuadBorder};
  height: ${getSize(window.innerWidth)}px;
  width: ${getSize(window.innerWidth)}px;
  flex: 0 0 ${getSize(window.innerWidth)}px;
  overflow: hidden;
  justify-content: center;
  align-items: center;
`;

export const BubbleVideo = styled.video``;
