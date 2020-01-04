import React, {useRef, useEffect} from 'react'
import DelayedReveal from '../DelayedReveal/it.coffee'

import l from './styled'
import * as c from '../../constants'
import {cx} from '../../utils/style'
import useLoader from './useLoader.coffee'

Image = (p) =>
  [s, {increment}] = useLoader()
  <l.Image
    src={c.SRC_URL + 'commons/' + p.name}
    className={p.className}
    onLoad={increment}
  />

Video = (p) =>
  [s, {increment}] = useLoader()
  video = useRef()
  playVideo = =>
    video.current.play() if p.mode is 'show'
    undefined
  useEffect playVideo, [p.mode]
  <l.Video src={c.SRC_URL + 'videos/' + p.name + '.mp4'}
    ref={video} className={p.className}
    muted autoPlay={p.mode is 'show'} playsInline preload='auto'
    onCanPlay={increment} loop={yes}
  />

export Mangina = =>
  <l.Centered>
    <Image name='mangina.jpg' className='fullHeight' />
  </l.Centered>

export Trump = =>
  <l.Centered>
    <Image name='trumpf.jpg' />
    <l.Credit>Image by&nbsp;<a href="https://pixabay.com/users/tiburi-2851152/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">Tibor Janosi Mozes</a>&nbsp;from&nbsp;<a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">Pixabay</a></l.Credit>
  </l.Centered>

GridCell = (p) =>
  [s, {increment}] = useLoader()
  <l.Cell>
    <DelayedReveal delay={1000 + p.delay} start={p.mode is 'show'}>
      <l.GridImage
        src={c.SRC_URL + 'commons/' + p.id + '.jpg'}
        delay={p.delay}
        onLoad={increment}
        mode={p.mode}
      />
    </DelayedReveal>
  </l.Cell>

export PaintShow = (p) =>
  <l.Centered mode={p.mode}>
    <Video name='paintshowq' mode={p.mode} className='backdrop' />
    <l.Yearbook>
      <GridCell id='dr john' delay={1000} mode={p.mode} />
      <GridCell id='yummy boy' delay={2000} mode={p.mode} />
      <GridCell id='chaquita' delay={3000} mode={p.mode} />
      <GridCell id='easter jesus' delay={4000} mode={p.mode} />
      <GridCell id='jojo' delay={4500} mode={p.mode} />
      <GridCell id='merman 7' delay={3500} mode={p.mode} />
      <GridCell id='rainbow eyes' delay={2500} mode={p.mode} />
      <GridCell id='lost at sea' delay={1500} mode={p.mode} />
      <GridCell id='sunset babe' delay={500} mode={p.mode} />
    </l.Yearbook>
  </l.Centered>

export Jesus = (p) =>
  <l.Centered>
    <Video name='jubileeq' mode={p.mode} className='fullWidth' />
  </l.Centered>

export Mitch = =>
  <l.Centered>
    <Image name='mitch.jpg' />
  </l.Centered>

export Eymboard = =>
  <l.Centered className='scrollX'>
    <Image name='eymboard.jpg' />
  </l.Centered>

export Sneakers = =>
  <l.Centered>
    <Image name='sneakers.jpg' className='fullHeight' />
  </l.Centered>

Mangina.duration = 1500
Trump.duration = 1000
PaintShow.duration = 7000
Jesus.duration = 4000
Mitch.duration = 2000
Eymboard.duration = 10000
Sneakers.duration = 5000
