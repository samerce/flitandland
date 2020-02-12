import React, {useRef, useEffect, useState, useLayoutEffect, useMemo} from 'react'
import DelayedReveal from '../DelayedReveal/it.coffee'
import MailingList from '../MailingList/it.coffee'
import Player from 'react-player'

import l from './styled'
import * as c from '../../constants'

import {useInView} from 'react-intersection-observer'
import {useSpring} from 'react-spring'
import {cx} from '../../utils/style'
import useLoader from './useLoader.coffee'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import useToggle from '../../hooks/useToggle.coffee'

Image = (p) =>
  {screenWidth, screenHeight} = useScreenSize()
  height = useMemo (=> screenHeight * .9), [screenHeight]
  <l.Image
    {...p}
    src={c.SRC_URL + 'commons/' + p.name}
    className={p.className + (if screenWidth > 1400 then ' fullHeight' else '')}
    fullHeight={height}
  />

VideoConfig =
  file:
    attributes: {preload: 'auto'}
  youtube:
    preload: yes
    playerVars: {modestbranding: yes, rel: no, controls: yes}
Video = (p) =>
  [playing, togglePlaying] = useToggle yes
  [didClickOnce, setDidClickOnce] = useState no
  {screenWidth} = useScreenSize()

  size = useMemo (=>
    width = screenWidth * .85
    width: width, height: (9/16) * width
  ), [screenWidth]
  url =
    if p.name then c.CDN_URL + 'videos/' + p.name + '.mp4'
    else p.url
  onClick = =>
    if didClickOnce then togglePlaying()
    else setDidClickOnce yes

  <l.VideoRoot>
    <Player url={url} wrapper={l.Video} width={size.width} height={size.height}
      playing={p.inView and playing} playsinline muted={not didClickOnce}
      loop={yes} onClick={onClick} controls={didClickOnce}
      config={VideoConfig}
    />
    <l.VideoSoundPrompt className={cx hide: didClickOnce} onClick={onClick}>
      click for audio
    </l.VideoSoundPrompt>
  </l.VideoRoot>

export Mangina = (p) =>
  <l.Centered>
    <Image name='mangina.jpg' className='fullHeight' />
  </l.Centered>

export Yes = =>
  <l.Centered className='pong'>
    <l.Pot>
      emancipated lands of<l.zon>&nbsp;yes, and&nbsp;</l.zon>await you—<br/>
      whole celestial realms outside the absurd world of no.
    </l.Pot>
  </l.Centered>

export Trump = (p) =>
  <l.Centered>
    <Image name='trumpf.jpg' />
    <l.Credit>Image by&nbsp;<a href="https://pixabay.com/users/tiburi-2851152/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">
      Tibor Janosi Mozes
    </a>&nbsp;from&nbsp;
    <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273">Pixabay</a></l.Credit>
  </l.Centered>

export Waggle = =>
  <l.Centered className='ping'>
    <l.Pot>
      flicker flop ripple dart waggle waving loot—<br/>
      wonderful hangs everywhere so i sample the fruit.
    </l.Pot>
  </l.Centered>

export TJ = =>
  [ref, inView] = useInView(threshold: .5)
  <l.Centered ref={ref}>
    <Video url='https://www.youtube.com/watch?v=rmXjuF1GLK0' inView={inView} />
  </l.Centered>

Texts = [
  {content: 'if 100 million of us put four quarters in our pocket every single day and gave them out to the first four people that wanted them, then $100 million a day would circulate into the hands of those who need a break.', delay: 0},
  {content: 'that’s $365 billion a year, one quarter at a time.', delay: 5000},
  # {content: 'power will tell you it’s hopeless. that the problems are too great to contemplate. that this is as good as it gets.', duration: 1000},
  # {content: 'it’s the lie of our lifetime.', duration: 1000},
]
export Intro = (p) =>
  [ref, inView] = useInView(threshold: .5, triggerOnce: yes)
  delay = 0
  <l.Centered ref={ref} className='intro pong'>
    {Texts.map (text) =>
      delay += text.delay
      <l.IntroText delay={delay} className={cx show: inView}>
        {text.content}
      </l.IntroText>
    }
  </l.Centered>

FullCycleDuration = 4500
BaseDelay = 1000
GridCell = (p) =>
  [s, increment] = useLoader()
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

# export PaintShow = (p) =>
#   [ref, inView] = useInView(threshold: .5, triggerOnce: yes)
#   <l.Centered ref={ref}>
#     <Video name='paintshowq' inView={inView} className='backdrop' />
#     <l.Yearbook>
#       <GridCell images={['dr john', 'sneakers', 'needs work but']}
#         delay={1000} mode={inView} />
#       <GridCell images={['yummy boy', 'a meeting', 'gayclub']} delay={2000} mode={inView} />
#       <GridCell images={['chaquita', 'gee, i jus love him', 'beadme']}
#         delay={3000} mode={inView} />
#       <GridCell images={['easter jesus', 'desire-vignette', 'im a man, maam']}
#         delay={4000} mode={inView} />
#       <GridCell images={['jojo 3', 'mama y yo', 'love']}
#         delay={4500} mode={inView} />
#       <GridCell images={['merman 7', 'grain train', 'jojo']} delay={3500} mode={inView} />
#       <GridCell images={['rainbow eyes', 'mama y rick', 'flaggot']}
#         delay={2500} mode={inView} />
#       <GridCell images={['lost at sea', 'glitterfysh', 'boys being girly boys']}
#         delay={1500} mode={inView} />
#       <GridCell images={['sunset babe', 'mama y yo 2', 'delusion']}
#         delay={500} mode={inView} />
#     </l.Yearbook>
#   </l.Centered>

export Jesus = (p) =>
  [ref, inView] = useInView(threshold: .5)
  <l.Centered ref={ref}>
    <Video name='jubileeq' inView={inView} />
  </l.Centered>

export Heart = =>
  <l.Centered className='pong'>
    <l.Pot>
      <l.zon>hollywood</l.zon> heads to the<l.zon>&nbsp;heartland</l.zon>
    </l.Pot>
  </l.Centered>

export Revolution = =>
  <l.Centered>
    <Image name='nonviolent revolution small.png' className='revo' />
  </l.Centered>


export Mitch = (p) =>
  <l.Centered>
    <Image name='mitch.jpg' />
  </l.Centered>

export Seed = =>
  <l.Centered className='pong'>
    <l.Pot>
      start with a single<l.zon>&nbsp;flitter</l.zon>. one seed.<br/>
      an idea. sent out on the thimble of<l.zon>&nbsp;love</l.zon>.<br/>
      an act of pure<l.zon>&nbsp;creation</l.zon>.
    </l.Pot>
  </l.Centered>

export Eymboard = (p) =>
  <l.Centered>
    <Image name='eymboard.jpg' />
  </l.Centered>

export LandingPage = (p) =>
  {screenHeight} = useScreenSize()
  imageHeight = useMemo (=> screenHeight * .8), [screenHeight]
  <l.LandingPage>
    <l.Header><l.yow>new book</l.yow> out soon!</l.Header>
    <Image name='dragwhitehouse.jpg' className='cover fullHeight'
      height={imageHeight}
    />
    <MailingList />
  </l.LandingPage>

export Whimsy = =>
  <l.Centered className='pong'>
    <l.Pot>
      cling to your<l.zon>&nbsp;whimsy,</l.zon><br/>
      you are a delightful stimulant; <br/>
      best deployed as stirring propaganda<br/>
      that never loses sight of the sun.
    </l.Pot>
  </l.Centered>


export Sneakers = (p) =>
  <l.Centered className='sneakers'>
    <Image name='sneakers.jpg' className='fullHeight' />
  </l.Centered>

export Reborn = =>
  <l.Centered className='ping'>
    <l.Pot>
      whatever you call it:<br/>
      <l.zon>get dislodged from the system</l.zon><br/><br/>

      freedom cost me everything<br/>
      which turns out to be nothing at all<br/><br/>

      waking to yes will kill you—<br/>
      and then you will be<l.zon>&nbsp;reborn</l.zon><br/><br/>

      i would get rid of everything<br/>
      <l.yow>and begin again—</l.yow>
    </l.Pot>
  </l.Centered>

# Intro.duration = 3000
# Mangina.duration = 1500
# Trump.duration = 1000
# PaintShow.duration = 15000
# Jesus.duration = 4000
# Mitch.duration = 2000
# Eymboard.duration = 10000
# Sneakers.duration = 5000
# LandingPage.duration = 0
