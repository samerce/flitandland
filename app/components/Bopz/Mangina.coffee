import React, {useRef, useEffect, useState, useLayoutEffect, useMemo} from 'react'
import MailingList from '../MailingList/it.coffee'
import Player from 'react-player'
import QuickHit from '../QuickHit/it.coffee'

import l from './styled'
import * as c from '../../constants'

import {useInView} from 'react-intersection-observer'
import {useSpring} from 'react-spring'
import {cx} from '../../utils/style'
import useLoader from './useLoader.coffee'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import useToggle from '../../hooks/useToggle.coffee'
import useDelayedReveal from '../../hooks/useDelayedReveal.coffee'

import {openInNewTab} from '../../utils/nav'

BookUrl = 'https://books.google.com/books?id=RxPRDwAAQBAJ&printsec=frontcover#v=twopage&q&f=false'

Image = (p) =>
  {screenWidth, screenHeight} = useScreenSize()
  height = useMemo (=> screenHeight * .9), [screenHeight]
  <l.Image
    {...p}
    src={c.SRC_URL + 'commons/' + p.name}
    className={cx
      [p.className]: yes,
      portrait: screenWidth < screenHeight,
    }
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

Tickle = (p) =>
  [classes] = useDelayedReveal p.inView, p.delay || 4000
  <l.more href={p.to} target='_blank' className={cx
    hide: not p.inView, [classes]: yes, [p.className]: yes
  }>
    {p.children}
  </l.more>

Carousel = (p) =>
  [index, setIndex] = useState 0
  [timer, setTimer] = useState()
  numCards = p.cards.length
  {screenHeight} = useScreenSize()
  carouselHeight = useMemo (=> screenHeight - 220), [screenHeight]

  useLayoutEffect (=>
    setTimer every 1500, =>
      setIndex (i) => i + 1
      if index >= numCards - 1 then timer.clear()
    => timer?.clear()
  ), []

  <l.Carousel height={carouselHeight} className='intro'>
    {p.cards.map (card, thisIndex) =>
      <l.CardRoot className={cx enter: (thisIndex <= index)}
        rotate={Math.random() * (-1 * (thisIndex % 3))}>
        {card}
      </l.CardRoot>
    }
  </l.Carousel>

# <l.Pot className='titleCard'>
#   drag queen <l.yow>in the</l.yow> white house
# </l.Pot>,
BookLure = (p) =>
  <l.Centered>
    <l.Title>drag queen&nbsp;<l.yow>in the</l.yow>&nbsp;white house</l.Title>
    <Carousel cards={[
      <Image name='back cover sd.jpg' />,
      <l.Pot>
        it’s time for over-the-top <l.zon>realness</l.zon><br/>
        to shock the <l.zon>conscience</l.zon> of our nation
      </l.Pot>,
      <Image name='dragwhitehouse.jpg' className='cover fullHeight' />,
    ]} />
    <l.ActionZone>
      <l.BigAction>skip intro »
      </l.BigAction>
      <l.TinyActions>
        <l.TinyAction><i className='fab fa-medium-m' /></l.TinyAction>
      </l.TinyActions>
    </l.ActionZone>
  </l.Centered>

export LandingPage = (p) =>
  [ref, inView] = useInView(threshold: .54)
  {screenHeight} = useScreenSize()
  imageHeight = useMemo (=> screenHeight * .8), [screenHeight]
  <l.LandingPage ref={ref}>
    <a href={BookUrl} target='_blank'>
      <Image name='dqitwh front cover mq.jpg' className='cover fullHeight'
        height={imageHeight}
      />
    </a>
    <l.Header href={BookUrl} target='_blank'>
      <l.yow>new book</l.yow><span>get it now</span>
    </l.Header>
  </l.LandingPage>

export BookMangina = (p) =>
  [ref, inView] = useInView(threshold: .54)
  <l.Centered ref={ref}>
    <a href={BookUrl} target='_blank'>
      <Image name='back cover sd.jpg' className='fullHeight'/>
    </a>
  </l.Centered>

export FirstPage = =>
  <l.Centered>
    <a href={BookUrl} target='_blank'>
      <Image name='firstpage.jpg' className='fullHeight' />
    </a>
  </l.Centered>

export VoteThemOut = =>
  <l.Centered>
    <a href={BookUrl} target='_blank'>
      <Image name='activist mq.jpg' />
    </a>
  </l.Centered>

export Queers = =>
  <l.Centered>
    <a href={BookUrl} target='_blank'>
      <Image name='fablovezest mq.jpg' />
    </a>
  </l.Centered>

export Bottom = =>
  <l.Centered className='bottom'>
    <a href='https://www.instagram.com/expressyourmess' target='_blank'>
      <i className='fab fa-instagram' />
    </a>
    <MailingList />
    <a href='https://www.twitter.com/expressyourmess' target='_blank'>
      <i className='fab fa-twitter' />
    </a>
  </l.Centered>

# export Mangina = (p) =>
#   [ref, inView] = useInView(threshold: .54)
#   <l.Centered ref={ref}>
#     <Image name='mangina.jpg' className='fullHeight' />
#     <Tickle inView={inView}
#       to='https://www.etsy.com/listing/674899618/men-from-mangina-modern-art-nude-print'>
#       get it
#     </Tickle>
#   </l.Centered>

# export Yes = =>
#   [ref, inView] = useInView(threshold: .54)
#   <l.Centered className='pong' ref={ref}>
#     <l.Pot>
#       emancipated lands of<l.zon>&nbsp;yes, and&nbsp;</l.zon>await you—<br/>
#       whole celestial realms outside the absurd world of no.
#     </l.Pot>
#     <Tickle inView={inView} to='https://medium.com/@purpleperson'>
#       more
#     </Tickle>
#   </l.Centered>
#
# export Trump = (p) =>
#   [ref, inView] = useInView(threshold: .54)
#   <l.Centered ref={ref}>
#     <Image name='trumpf.jpg' />
#     <Tickle inView={inView} to='https://pixabay.com/users/tiburi-2851152/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1915273'>
#       tibor janosi mozes
#     </Tickle>
#   </l.Centered>
#
# export Waggle = =>
#   <l.Centered className='ping'>
#     <l.Pot>
#       flicker flop ripple dart waggle waving loot—<br/>
#       wonderful hangs everywhere so i sample the fruit.
#     </l.Pot>
#   </l.Centered>
#
# export TJ = =>
#   [ref, inView] = useInView(threshold: .5)
#   <l.Centered ref={ref}>
#     <Video url='https://www.youtube.com/watch?v=rmXjuF1GLK0' inView={inView} />
#   </l.Centered>
#
# Texts = [
#   {content: 'if 100 million of us put four quarters in our pocket every single day and gave them out to the first four people that wanted them, then $100 million a day would circulate into the hands of those who need a break.', delay: 0},
#   {content: 'that’s $365 billion a year, one quarter at a time.', delay: 5000},
#   # {content: 'power will tell you it’s hopeless. that the problems are too great to contemplate. that this is as good as it gets.', duration: 1000},
#   # {content: 'it’s the lie of our lifetime.', duration: 1000},
# ]
# export Intro = (p) =>
#   [ref, inView] = useInView(threshold: .5, triggerOnce: yes)
#   delay = 0
#   <l.Centered ref={ref} className='intro pong'>
#     {Texts.map (text) =>
#       delay += text.delay
#       <l.IntroText delay={delay} className={cx show: inView}>
#         {text.content}
#       </l.IntroText>
#     }
#   </l.Centered>
#
# export Jesus = (p) =>
#   [ref, inView] = useInView(threshold: .5)
#   <l.Centered ref={ref}>
#     <Video name='jubileeq' inView={inView} />
#   </l.Centered>
#
# export Heart = =>
#   <l.Centered className='pong'>
#     <l.Pot>
#       <l.zon>hollywood</l.zon> heads to the<l.zon>&nbsp;heartland</l.zon>
#     </l.Pot>
#   </l.Centered>
#
# export Revolution = =>
#   <l.Centered>
#     <Image name='nonviolent revolution small.png' className='revo' />
#   </l.Centered>
#
#
# export Mitch = (p) =>
#   <l.Centered>
#     <Image name='mitch.jpg' />
#   </l.Centered>
#
# export Seed = =>
#   <l.Centered className='pong'>
#     <l.Pot>
#       start with a single<l.zon>&nbsp;flitter</l.zon>. one seed.<br/>
#       an idea. sent out on the thimble of<l.zon>&nbsp;love</l.zon>.<br/>
#       an act of pure<l.zon>&nbsp;creation</l.zon>.
#     </l.Pot>
#   </l.Centered>
#
# export Eymboard = (p) =>
#   <l.Centered>
#     <Image name='eymboard.jpg' />
#   </l.Centered>
#
# export Whimsy = =>
#   <l.Centered className='pong'>
#     <l.Pot>
#       cling to your<l.zon>&nbsp;whimsy,</l.zon><br/>
#       you are a delightful stimulant; <br/>
#       best deployed as stirring propaganda<br/>
#       that never loses sight of the sun.
#     </l.Pot>
#   </l.Centered>
#
#
# export Sneakers = (p) =>
#   <l.Centered className='sneakers'>
#     <Image name='sneakers.jpg' className='fullHeight' />
#   </l.Centered>
#
# export Reborn = =>
#   <l.Centered className='ping'>
#     <l.Pot>
#       whatever you call it:<br/>
#       <l.zon>get dislodged from the system</l.zon><br/><br/>
#
#       freedom cost me everything<br/>
#       which turns out to be nothing at all<br/><br/>
#
#       waking to yes will kill you—<br/>
#       and then you will be<l.zon>&nbsp;reborn</l.zon><br/><br/>
#
#       i would get rid of everything<br/>
#       <l.yow>and <a href={BookUrl} target='_blank'>begin again</a>—</l.yow>
#     </l.Pot>
#   </l.Centered>

# Intro.duration = 3000
# Mangina.duration = 1500
# Trump.duration = 1000
# PaintShow.duration = 15000
# Jesus.duration = 4000
# Mitch.duration = 2000
# Eymboard.duration = 10000
# Sneakers.duration = 5000
# LandingPage.duration = 0
