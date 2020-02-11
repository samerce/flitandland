import React, {useRef, useEffect, useState, useLayoutEffect, useMemo} from 'react'
import DelayedReveal from '../DelayedReveal/it.coffee'

import l from './styled'
import * as c from '../../constants'

import {useInView} from 'react-intersection-observer'
import {useSpring} from 'react-spring'
import {cx} from '../../utils/style'
import useLoader from './useLoader.coffee'
import useScreenSize from '../../hooks/useScreenSize.coffee'

FullHeightStyle = width: 'initial', height: '90%'
Image = (p) =>
  [s, {increment}] = useLoader()
  {screenWidth} = useScreenSize()
  <l.Image
    src={c.SRC_URL + 'commons/' + p.name}
    className={p.className + (if screenWidth > 1400 then ' fullHeight' else '')}
    onLoad={increment}
  />

Video = (p) =>
  video = useRef()
  [ready, setReady] = useState no
  [s, {increment}] = useLoader()

  useEffect (=>
    if ready and p.inView
      video.current.play()
    else video.current.pause()
    undefined
  ), [p.inView]

  <l.Video src={c.CDN_URL + 'videos/' + p.name + '.mp4'}
    ref={video} className={p.className}
    muted autoPlay={p.mode is 'show'} playsInline preload='auto'
    loop={yes} onCanPlay={=>
      setReady yes
      video.current.play() if p.inView
    }
  />

export Mangina = (p) =>
  <l.Centered>
    <Image name='mangina.jpg' className='fullHeight' />
  </l.Centered>

export Trump = (p) =>
  <l.Centered>
    <Image name='trumpf.jpg' />
    <l.Credit>Image by&nbsp;<a href="https://pixabay.com/users/tiburi-2851152/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">
      Tibor Janosi Mozes
    </a>&nbsp;from&nbsp;
    <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">Pixabay</a></l.Credit>
  </l.Centered>

export TJ = =>
  {screenWidth} = useScreenSize()
  videoWidth = useMemo (=> screenWidth * .9), [screenWidth]
  videoHeight = useMemo (=> (9/16) * videoWidth), [videoWidth]
  <l.Centered>
    <iframe width={videoWidth} height={videoHeight} className='youtubeVid'
   src="https://www.youtube-nocookie.com/embed/rmXjuF1GLK0?controls=0" frameBorder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowFullScreen></iframe>
  </l.Centered>

Texts = [
  {content: 'if 100 million of us put four quarters in our pocket every single day and gave them out to the first four people that wanted them, then $100 million a day would circulate into the hands of those who need a break.', delay: 500},
  {content: 'that’s $365 billion a year, one quarter at a time.', delay: 5000},
  # {content: 'power will tell you it’s hopeless. that the problems are too great to contemplate. that this is as good as it gets.', duration: 1000},
  # {content: 'it’s the lie of our lifetime.', duration: 1000},
]
export Intro = (p) =>
  [ref, inView] = useInView(threshold: .5, triggerOnce: yes)
  delay = 0
  <l.IntroRoot ref={ref}>
    {Texts.map (text) =>
      delay += text.delay
      <l.IntroText delay={delay} className={cx show: inView}>
        {text.content}
      </l.IntroText>
    }
  </l.IntroRoot>

FullCycleDuration = 4500
BaseDelay = 1000
GridCell = (p) =>
  [s, {increment}] = useLoader()
  <l.Cell>
    {p.images.map (image, i) =>
      <DelayedReveal delay={BaseDelay + i * FullCycleDuration + p.delay}
        start={p.mode} key={image}>
        <l.GridImage
          src={c.SRC_URL + 'commons/' + image + '.jpg'}
          delay={p.delay}
          onLoad={increment}
          show={p.mode}
          style={{zIndex: (i+1) * 1000}}
        />
      </DelayedReveal>
    }
  </l.Cell>

export PaintShow = (p) =>
  [ref, inView] = useInView(threshold: .5, triggerOnce: yes)
  <l.Centered ref={ref}>
    <Video name='paintshowq' inView={inView} className='backdrop' />
    <l.Yearbook>
      <GridCell images={['dr john', 'sneakers', 'needs work but']}
        delay={1000} mode={inView} />
      <GridCell images={['yummy boy', 'a meeting', 'gayclub']} delay={2000} mode={inView} />
      <GridCell images={['chaquita', 'gee, i jus love him', 'beadme']}
        delay={3000} mode={inView} />
      <GridCell images={['easter jesus', 'desire-vignette', 'im a man, maam']}
        delay={4000} mode={inView} />
      <GridCell images={['jojo 3', 'mama y yo', 'love']}
        delay={4500} mode={inView} />
      <GridCell images={['merman 7', 'grain train', 'jojo']} delay={3500} mode={inView} />
      <GridCell images={['rainbow eyes', 'mama y rick', 'flaggot']}
        delay={2500} mode={inView} />
      <GridCell images={['lost at sea', 'glitterfysh', 'boys being girly boys']}
        delay={1500} mode={inView} />
      <GridCell images={['sunset babe', 'mama y yo 2', 'delusion']}
        delay={500} mode={inView} />
    </l.Yearbook>
  </l.Centered>

export Jesus = (p) =>
  [ref, inView] = useInView(threshold: .5)
  <l.Centered ref={ref}>
    <Video name='jubileeq' className='fullWidth' inView={inView} />
  </l.Centered>

export Mitch = (p) =>
  <l.Centered>
    <Image name='mitch.jpg' />
  </l.Centered>

export Eymboard = (p) =>
  <l.Centered>
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
