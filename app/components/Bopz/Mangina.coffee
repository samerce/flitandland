import React, {useRef, useEffect, useState, useLayoutEffect, useMemo, useCallback} from 'react'
import MailingList from '../MailingList/it.coffee'
import Player from 'react-player'
import QuickHit from '../QuickHit/it.coffee'

import l from './styled'
import * as c from '../../constants'

import {useSprings} from 'react-spring'
import {useDrag} from 'react-use-gesture'
import {useInView} from 'react-intersection-observer'
import {cx} from '../../utils/style'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import useToggle from '../../hooks/useToggle.coffee'
import useDelayedReveal from '../../hooks/useDelayedReveal.coffee'

import {openInNewTab} from '../../utils/nav'

BookUrl = 'https://www.amazon.com/gp/product/171000892X/'
FlitterFormUrl = 'https://forms.gle/8mzToRg25jVfBLSP8'

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
    width = if p.height then (16/9) * p.height else screenWidth * .85
    height = if p.height then p.height else (9/16) * width
    {width, height}
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

useLoader = (doneCount) =>
  [count, setCount] = useState 0
  [loaded, setIsLoaded] = useState no
  increment = useCallback (=> if not loaded then setCount (c) => c + 1), [loaded]
  useLayoutEffect (=> setIsLoaded(yes) if count >= doneCount), [count]
  [loaded, increment]

from = (x = 0) => x: x, y: 0
to = (delay = 0) => x: 0, y: 0, delay: delay

Deck = (p) =>
  [ref, inView] = useInView triggerOnce: yes, threshold: .9
  [loaded, markLoaded] = useLoader p.cards.length
  [mode, setMode] = useState 'intro'
  [topIndex, setTopIndex] = useState 0
  [spins] = useState => p.cards.map => Math.random() * 4 * (if Math.random() > .5 then -1 else 1)
  {screenWidth, screenHeight} = useScreenSize()
  {buttonAction, buttonText} = p.cards[topIndex]
  deckHeight = useMemo (=> screenHeight - 100), [screenHeight]
  numCards = p.cards.length
  incrementIndex = => setTopIndex (i) => (i + 1) % numCards
  decrementIndex = => setTopIndex (i) => ((i - 1) + numCards) % numCards
  goToNext = =>
    currentTopIndex = +topIndex
    set (i) =>
      return unless i is currentTopIndex
      x: screenWidth * 1.3
    after 200, =>
      incrementIndex()
      set (i) =>
        return unless i is currentTopIndex
        x: 0
  goToPrev = =>
    prevIndex = ((topIndex - 1) + numCards) % numCards
    set (i) =>
      return unless i is prevIndex
      x: screenWidth * -1.3
    after 200, =>
      decrementIndex()
      set (i) =>
        return unless i is prevIndex
        x: 0

  [props, set] = useSprings p.cards.length, (i) => from: from(screenWidth * 1.3)
  handleDrag = ({
    args: [index], down, movement: [mx, my], direction: [xDir, yDir], velocity, touches
  }) =>
    return if touches > 1

    trigger = no
    if not down and velocity > 0.2
      trigger = yes
      after 200, =>
        incrementIndex()
        set (i) => from() if index is i

    set (i) =>
      return unless index is i
      x: if trigger then screenWidth * 1.3 * xDir * velocity else if down then mx else 0
      y: if trigger then screenHeight * 1.3 * yDir * velocity else if down then my else 0
      config:
        friction: 50
        tension: 300 #if down then 200 else if trigger then 200 else 500
  withDrag = useDrag handleDrag, {axis: 'x'}

  cardDelay = (i) => (numCards - i - 1) * 324 + 500
  curtainsUp = =>
    setMode 'show'
    set (i) => to(cardDelay(i))
  useLayoutEffect (=>
    return if mode is 'show'
    return curtainsUp() if loaded and inView and mode is 'loading'
    timer = after 1080, =>
      if loaded and inView and mode isnt 'show' then curtainsUp()
      else if inView then setMode 'loading'
    => timer.clear()
  ), [loaded, inView, mode]

  <l.Deck ref={ref} key={ref}>
    <l.Title className={cx loading: mode isnt 'show'}>
      {p.title()}
      <l.LoadingText>{p.loading() if mode isnt 'show'}</l.LoadingText>
    </l.Title>
    <l.CardRoot className={cx hide: mode isnt 'show' or not inView}>
      {props.map ({x, y, rot, scale}, thisIndex) =>
        isTop = topIndex is thisIndex
        zIndex =
          if isTop then numCards
          else (numCards - (thisIndex - topIndex)) % numCards
        <l.Card key={thisIndex} spin={spins[thisIndex]} {...withDrag(thisIndex)}
          style={{x, y, zIndex, pointerEvents: if isTop then 'all' else 'none'}}>
          {p.cards[thisIndex].render({markLoaded, disabled: not isTop})}
        </l.Card>
      }
    </l.CardRoot>
    <l.ActionZone delay={cardDelay(0) + 500}
      className={cx hide: mode isnt 'show'}>
      <l.TinyAction onClick={goToPrev}>&lsaquo;</l.TinyAction>
      {if typeof buttonAction is 'function'
        <l.BigAction onClick={buttonAction}>
          {buttonText}
        </l.BigAction>
      else
        <l.BigAction>
          <a href={buttonAction} target='_blank'>
            {buttonText}
          </a>
        </l.BigAction>
      }
      <l.TinyAction onClick={goToNext}>&rsaquo;</l.TinyAction>
    </l.ActionZone>
  </l.Deck>

export BookLure = =>
  <Deck
    title={=> <div>drag queen&nbsp;<l.yow>in the</l.yow>&nbsp;white house</div>}
    loading={=> <>...brushing my wig...</>}
    cards={[
      {
        render: (p) =>
          <Image name='dqitwh front cover mq.jpg' className='cover fullHeight' onLoad={p.markLoaded} />
        buttonText: 'get the new book'
        buttonAction: => # open pyp checkout
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='shock'>
            <div>
              it’s time for over-the-top <l.zon>realness</l.zon><br/>
              to shock the <l.zon>conscience</l.zon> of our nation
            </div>
          </l.Pot>
        buttonText: 'sample the new book'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) => <Image name='back cover sd.jpg' onLoad={p.markLoaded} />
        buttonText: 'dive in now'
        buttonAction: BookUrl
      }
      {
        render: (p) =>
          <Image name='yes.jpg' className='fullHeight' onLoad={p.markLoaded} />
        buttonText: 'read more'
        buttonAction: BookUrl
      }
      {
        render: (p) =>
          <Image name='girlish.jpg' onLoad={p.markLoaded} />
        buttonText: 'instagram'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          <Image name='nonviolent revolution small.png' className='revo' onLoad={p.markLoaded} />
        buttonText: 'i’m into it'
        buttonAction: BookUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot>
            <MailingList disabled={p.disabled} />
          </l.Pot>
        buttonText: 'why join?'
        buttonAction: c.MEDIUM_URL
      }

    ]}
  />

export FlitterLure = =>
  <Deck
    title={=> <>flitters</>}
    loading={=> <>...slipping on my heels...</>}
    cards={[
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='flitandland'>
            what if you could work<br />
            anywhere, anytime,<br/>
            doing almost anything<br/>
            <l.zon>& get paid for it?</l.zon>
          </l.Pot>
        buttonText: 'um, yes please'
        buttonAction: FlitterFormUrl
      }
      {
        render: (p) =>
          <Image name='glitterfaeries.jpg' onLoad={p.markLoaded} />
        buttonText: 'more pictures!'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          <l.Pot className='pair'>
            <div className='txtbox'>
              job description:<br/>
              <l.zon>spread joy & knowledge</l.zon>
            </div>
            <div>
              <Image
                name='flitsis.jpg'
                className='fullHeight cozy'
                onLoad={p.markLoaded}
              />
            </div>
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: FlitterFormUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='flitpitch'>
            <div>
              imagine millions of flitters roaming america, being society’s antidepressant. that’s their job. stirring happiness & deescalating high-pressure situations.
            </div>
          </l.Pot>
        buttonText: 'read more'
        buttonAction: 'https://medium.com/@purpleperson'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          {screenHeight} = useScreenSize()
          videoHeight = useMemo (=> screenHeight * .5), [screenHeight]
          <l.Pot className='classrooms'>
            <div className='txtbox'>
              <l.zon>flitters</l.zon>
              open classrooms in the trenches
            </div>
            <Video
              url='https://www.youtube.com/watch?v=kWC957au5c8'
              inView={not p.disabled}
              height={videoHeight}
            />
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: 'https://forms.gle/8mzToRg25jVfBLSP8'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot>
            <div>
              <l.zon>flitters</l.zon>
              facilitate tough dialogues<br/>
              with levity & light
            </div>
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: 'https://forms.gle/8mzToRg25jVfBLSP8'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='yoga'>
            <div>
              <l.zon>flitters</l.zon>
              offer yoga & meditation
            </div>
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: FlitterFormUrl
      }
      {
        render: (p) =>
          <l.Pot className='drag'>
            <div className='txtbox'>
              <l.zon>flitters</l.zon>
              play dress up & do makeovers
            </div>
            <div>
              <Image
                name='mikeyfizzwhimzeh.jpg'
                className='fullHeight cozy'
                onLoad={p.markLoaded}
              />
            </div>
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: FlitterFormUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='rovingart'>
            <div>
              <l.zon>flitters</l.zon>
              pick up trash,<br/>
              plant trees,<br/>
              host events, <br/>
              raise vibes—<br/>
              they are roving
              <l.zon>creation!</l.zon>
            </div>
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: 'https://forms.gle/8mzToRg25jVfBLSP8'
      }
    ]}
  />

export LampshadeLure = =>
  <Deck
    title={=> <>lampshade</>}
    loading={=> <>...pulling some espresso...</>}
    cards={[
      {
        render: (p) =>
          <Image name='activist mq.jpg' onLoad={p.markLoaded} />
        buttonText: 'cultivate YES'
        buttonAction: 'mailto:whynot@expressyourmess.com'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='shock'>
            <l.zon>community</l.zon>meet<l.zon>commodity</l.zon>
          </l.Pot>
        buttonText: 'get involved'
        buttonAction: 'mailto:whynot@expressyourmess?subject=lampshade'
      }
      {
        render: (p) =>
          <Image name='firstpage.jpg' className='fullHeight' onLoad={p.markLoaded} />
        buttonText: 'read more'
        buttonAction: BookUrl
      }
      {
        render: (p) => <Image name='back cover sd.jpg' onLoad={p.markLoaded} />
        buttonText: 'dive in now'
        buttonAction: BookUrl
      },
    ]}
  />

export EymULure = =>
  <Deck
    title={=> <>eym<l.yow>u</l.yow></>}
    loading={=> <>...mixing some paint...</>}
    cards={[
      {
        render: (p) =>
          <Image name='activist mq.jpg' onLoad={p.markLoaded} />
        buttonText: 'cultivate Yes'
        buttonAction: 'mailto:whynot@expressyourmess.com'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='shock'>
            <l.zon>hollywood</l.zon><br/>
            heads to the<br/>
            <l.zon>heartland</l.zon>
          </l.Pot>
        buttonText: 'join the movement'
        buttonAction: 'mailto:whynot@expressyourmess?subject=eymu'
      }
      {
        render: (p) =>
          <Image name='firstpage.jpg' className='fullHeight' onLoad={p.markLoaded} />
        buttonText: 'read more'
        buttonAction: BookUrl
      }
      {
        render: (p) => <Image name='back cover sd.jpg' onLoad={p.markLoaded} />
        buttonText: 'dive in now'
        buttonAction: BookUrl
      },
    ]}
  />

export Footer = =>
  <l.Centered className='bottom'>
    <a href='https://www.instagram.com/expressyourmess' target='_blank'>
      <i className='fab fa-instagram' />
    </a>
    <a href='https://www.medium.com/the-purple-republic' target='_blank'>
      <i className='fab fa-medium-m' />
    </a>
    <a href='https://www.twitter.com/expressyourmess' target='_blank'>
      <i className='fab fa-twitter' />
    </a>
    <a href={BookUrl} target='_blank' className='book-link'>
      get the new book!
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
