import React, {useRef, useEffect, useState, useLayoutEffect} from 'react'
import DelayedReveal from '../DelayedReveal/it.coffee'

import l from './styled'
import * as c from '../../constants'

import {useSpring} from 'react-spring'
import {cx} from '../../utils/style'
import useLoader from './useLoader.coffee'
import useScreenSize from '../../hooks/useScreenSize.coffee'

FullHeightStyle = width: 'initial', height: '90%'
Image = (p) =>
  [s, increment] = useLoader()
  {screenWidth} = useScreenSize()
  <l.Image
    src={c.SRC_URL + 'commons/' + p.name}
    className={p.className + (if screenWidth > 1400 then ' fullHeight' else '')}
    onLoad={increment}
  />

Video = (p) =>
  [ready, setReady] = useState no
  [triggered, setTriggered] = useState no
  [s, increment] = useLoader()
  video = useRef()
  playVideo = =>
    setTriggered yes
    video.current.play() if p.mode is 'show' and ready
    undefined
  useEffect playVideo, [p.mode]
  <l.Video src={c.CDN_URL + 'videos/' + p.name + '.mp4'}
    ref={video} className={p.className}
    muted autoPlay={p.mode is 'show'} playsInline preload='auto'
    loop={yes} onCanPlay={=>
      setReady yes
      playVideo() if triggered
    }
  />

Texts = [
  {content: ':) heyo. think about this...', duration: 0},
  {content: 'if 100 million of us put four quarters in our pocket every single day and gave them out to the first four people that wanted them, then $100 million a day would circulate into the hands of those who need a break.', duration: 1000},
  {content: 'that’s $365 billion a year, one quarter at a time.', duration: 5000},
  # {content: 'power will tell you it’s hopeless. that the problems are too great to contemplate. that this is as good as it gets.', duration: 1000},
  # {content: 'it’s the lie of our lifetime.', duration: 1000},
  {content: <div>
    whenever you’re looking to explore, tickle me.<br/>
    i’m ash, nice to meetcha.
  </div>, duration: 3000},
  {content: <>
    <i className='fa fa-spinner' />
    <div>still decorating, gimme a sec...</div>
  </>, duration: 3000}
]
reducer = (duration, t) => duration + t.duration
TotalDuration = Texts.reduce reducer, 3000
export Intro = (p) =>
  [texts, setTexts] = useState Texts
  useLayoutEffect (=>
    if p.isLoaded
      after TotalDuration + 5000, p.actions.play
      setTexts (t) =>
        t.pop()
        [...t, {content: <>
          <div>touch anywhere to move on.<br/></div>
          <div>hold anywhere to pause the action.</div>
          </>, duration: 3000
        }]
    undefined
  ), [p.isLoaded]

  duration = 0
  <l.IntroRoot>
    {texts.map (text) =>
      duration += text.duration
      <l.IntroText delay={duration + 3000}>
        {text.content}
      </l.IntroText>
    }
  </l.IntroRoot>

export Mangina = (p) =>
  <l.Centered>
    <Image name='mangina.jpg' className='fullHeight' />
  </l.Centered>

export Trump = (p) =>
  <l.Centered>
    <Image name='trumpf.jpg' />
    <l.Credit>Image by&nbsp;<a href="https://pixabay.com/users/tiburi-2851152/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">Tibor Janosi Mozes</a>&nbsp;from&nbsp;<a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">Pixabay</a></l.Credit>
  </l.Centered>

FullCycleDuration = 4500
BaseDelay = 1000
GridCell = (p) =>
  [s, increment] = useLoader()
  <l.Cell>
    {p.images.map (image, i) =>
      <DelayedReveal delay={BaseDelay + i * FullCycleDuration + p.delay}
        start={p.mode is 'show'} key={image}>
        <l.GridImage
          src={c.SRC_URL + 'commons/' + image + '.jpg'}
          delay={p.delay}
          onLoad={increment}
          mode={p.mode}
          style={{zIndex: (i+1) * 1000}}
        />
      </DelayedReveal>
    }
  </l.Cell>

export PaintShow = (p) =>
  <l.Centered mode={p.mode}>
    <Video name='paintshowq' mode={p.mode} className='backdrop' />
    <l.Yearbook>
      <GridCell images={['dr john', 'sneakers', 'needs work but']}
        delay={1000} mode={p.mode} />
      <GridCell images={['yummy boy', 'a meeting', 'gayclub']} delay={2000} mode={p.mode} />
      <GridCell images={['chaquita', 'gee, i jus love him', 'beadme']}
        delay={3000} mode={p.mode} />
      <GridCell images={['easter jesus', 'desire-vignette', 'im a man, maam']}
        delay={4000} mode={p.mode} />
      <GridCell images={['jojo 3', 'mama y yo', 'love']}
        delay={4500} mode={p.mode} />
      <GridCell images={['merman 7', 'grain train', 'jojo']} delay={3500} mode={p.mode} />
      <GridCell images={['rainbow eyes', 'mama y rick', 'flaggot']}
        delay={2500} mode={p.mode} />
      <GridCell images={['lost at sea', 'glitterfysh', 'boys being girly boys']}
        delay={1500} mode={p.mode} />
      <GridCell images={['sunset babe', 'mama y yo 2', 'delusion']}
        delay={500} mode={p.mode} />
    </l.Yearbook>
  </l.Centered>

export Jesus = (p) =>
  <l.Centered>
    <Video name='jubileeq' mode={p.mode} className='fullWidth' />
  </l.Centered>

export Mitch = (p) =>
  <l.Centered>
    <Image name='mitch.jpg' />
  </l.Centered>

export Eymboard = (p) =>
  <l.Centered className='scrollX'>
    <Image name='eymboard.jpg' />
  </l.Centered>

export Sneakers = (p) =>
  <l.Centered>
    <Image name='sneakers.jpg' className='fullHeight' />
  </l.Centered>

Intro.duration = 3000
Mangina.duration = 1500
Trump.duration = 1000
PaintShow.duration = 15000
Jesus.duration = 4000
Mitch.duration = 2000
Eymboard.duration = 10000
Sneakers.duration = 5000
