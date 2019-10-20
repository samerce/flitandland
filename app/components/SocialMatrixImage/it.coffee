import React, {useState} from 'react'

import {
  Root, SocialFunBar, Icon, LikeCount, Image, EmojiGanja
} from './styled'
import {MatrixImage} from '../../global-styles'

import useTimer from '../../hooks/useTimer.coffee'

direction = => if Math.random() > .5 then 1 else -1
tilt = => direction() * Math.round(Math.random() * 6)

export default SocialMatrixImage = ({src, emoji, likes = 328}) =>
  {after} = useTimer()
  [_likes, setLikes] = useState likes
  [emojiGanja, setEmojiGanja] = useState null

  onClickIcon = (e) =>
    setEmojiGanja e
    after 1000, => setEmojiGanja null

  <Root tilt={tilt()}>
    <Image src={src} />
    <SocialFunBar>
      <Icon onClick={=> setLikes _likes + 1}>♥</Icon>
      <LikeCount>{_likes} million</LikeCount>
      {emoji.map (e) => <Icon onClick={=> onClickIcon(e)}>{e}</Icon>}
    </SocialFunBar>
    <EmojiGanja className={'show' if emojiGanja?}>
      {emojiGanja}
    </EmojiGanja>
  </Root>
