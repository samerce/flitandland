import React, {useRef, useEffect, useState, useLayoutEffect, useMemo, useCallback} from 'react'
import MailingList from '../MailingList/it.coffee'
import Player from 'react-player'

import l from './styled'
import * as c from '../../constants'

import {useSprings} from 'react-spring'
import {useDrag} from 'react-use-gesture'
import {useInView} from 'react-intersection-observer'
import {cx} from '../../utils/style'
import useScreenSize from '../../hooks/useScreenSize.coffee'
import useToggle from '../../hooks/useToggle.coffee'
import useDelayedReveal from '../../hooks/useDelayedReveal.coffee'
import useBus from '../../hooks/useBus.coffee'

import {openInNewTab} from '../../utils/nav'

BookUrl = 'https://www.amazon.com/gp/product/171000892X/'
FlitterFormUrl = 'https://forms.gle/8mzToRg25jVfBLSP8'

Image = (p) =>
  {screenWidth, screenHeight} = useScreenSize()
  height = useMemo (=> screenHeight * .9), [screenHeight]
  root = p.root or 'commons/'
  <l.Image
    {...p}
    src={c.SRC_URL + root + p.name}
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
  player = useRef()
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
      config={VideoConfig} ref={player}
      onPlay={=> player.current.getInternalPlayer().pauseVideo() if not p.inView}
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

OutNow = (p) =>
  <l.OutNow onClick={=> cast 'book.openCheckout'}
    className={cx show: p.show} delay={p.delay}>
    <l.woo>new book</l.woo>
    <l.yow>out now</l.yow>
  </l.OutNow>

Deck = (p) =>
  [ref, inView] = useInView(threshold: .54)
  [loaded, markLoaded] = useLoader p.cards.length
  [mode, setMode] = useState 'intro'
  [topIndex, setTopIndex] = useState 0
  [spins] = useState => p.cards.map => Math.random() * 4 * (if Math.random() > .5 then -1 else 1)
  {screenWidth, screenHeight} = useScreenSize()
  {buttonAction, buttonText} = p.cards[topIndex]
  numCards = p.cards.length
  incrementIndex = => setTopIndex (i) => (i + 1) % numCards
  decrementIndex = => setTopIndex (i) => ((i - 1) + numCards) % numCards
  goToNext = =>
    currentTopIndex = +topIndex
    set (i) => {x: screenWidth * 1.3} if i is currentTopIndex
    after 200, =>
      incrementIndex()
      set (i) => {x: 0} if i is currentTopIndex
  goToPrev = =>
    prevIndex = ((topIndex - 1) + numCards) % numCards
    set (i) => {x: screenWidth * -1.3} if i is prevIndex
    after 200, =>
      decrementIndex()
      set (i) => {x: 0} if i is prevIndex

  [props, set] = useSprings p.cards.length, (i) => from: from(screenWidth * 1.3)
  # handleDrag = ({
  #   args: [index], down, movement: [mx, my], direction: [xDir, yDir], velocity, touches
  # }) =>
  #   return if touches > 1
  #
  #   trigger = no
  #   if not down and velocity > 0.2
  #     trigger = yes
  #     after 200, =>
  #       incrementIndex()
  #       set (i) => from() if index is i
  #
  #   set (i) =>
  #     return unless index is i
  #     x: if trigger then screenWidth * 1.3 * xDir * velocity else if down then mx else 0
  #     y: if trigger then screenHeight * 1.3 * yDir * velocity else if down then my else 0
  #     config:
  #       friction: 50
  #       tension: 300 #if down then 200 else if trigger then 200 else 500
  # withDrag = useDrag handleDrag, {axis: 'x'}

  cardDelay = (i) => (numCards - i - 1) * 324 + 500
  curtainsUp = =>
    setMode 'show'
    set (i) => to(cardDelay(i))
    ga 'send', 'event', {
      eventCategory: 'deck'
      eventAction: 'view'
      eventLabel: p.id
    }
  useLayoutEffect (=>
    return if mode is 'show'
    return curtainsUp() if loaded and inView and mode is 'loading'
    timer = after (if p.id is 'book' then 2160 else 1080), =>
      if loaded and inView and mode isnt 'show' then curtainsUp()
      else if inView then setMode 'loading'
    => timer.clear()
  ), [loaded, inView, mode]

  [covered, setCovered] = useState no
  useBus
    'book.openCheckout': => setCovered yes
    'book.closeCheckout': => setCovered no

  <l.Deck ref={ref} key={ref} id={p.id}>
    {if p.id is 'book'
      <OutNow show={mode is 'show'} delay={cardDelay(0)} />
    }
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
        <l.Card key={thisIndex} spin={spins[thisIndex]}
          style={{x, y, zIndex}}>
          {p.cards[thisIndex].render({
            markLoaded,
            disabled: not isTop or not inView or covered
          })}
        </l.Card>
      }
    </l.CardRoot>
    <l.ActionZone delay={cardDelay(0) + 500}
      className={cx hide: mode isnt 'show'}>
      <l.TinyAction onClick={goToPrev}><a>&lsaquo;</a></l.TinyAction>
      {if typeof buttonAction is 'function'
        <l.BigAction onClick={buttonAction}>
          <a>{buttonText}</a>
        </l.BigAction>
      else
        <l.BigAction>
          <a href={buttonAction} target='_blank'>
            {buttonText}
          </a>
        </l.BigAction>
      }
      <l.TinyAction onClick={goToNext}><a>&rsaquo;</a></l.TinyAction>
    </l.ActionZone>
  </l.Deck>

export Book = =>
  <Deck id='book'
    title={=> <div>drag queen&nbsp;<l.yow>in the</l.yow>&nbsp;white house</div>}
    loading={=> <>brushing some wigs...</>}
    cards={[
      {
        render: (p) =>
          <Image name='dqitwh cover mq.jpg' className='cover fullHeight' onLoad={p.markLoaded} />
        buttonText: 'get the new book'
        buttonAction: => cast 'book.openCheckout'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='evolution'>
            <div>
              evolution cannot be stoppped<br/>
              long-shot drag queen runs for president<br/>
              and congress turns purple
            </div>
          </l.Pot>
        buttonText: 'read more'
        buttonAction: 'https://medium.com/@skitzysandcastle/in-the-beginning-was-the-end-88c928e7d3aa'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          {screenWidth, screenHeight, shape} = useScreenSize()
          videoHeight = useMemo (=>
            if shape is 'landscape' then screenHeight * .5
            else screenWidth * .9 * (9/16)
          ), [screenWidth, screenHeight]
          <Video
            url='https://www.youtube.com/watch?v=-VkMsRHsAmM'
            inView={not p.disabled}
            height={videoHeight}
          />
        buttonText: 'i’m so in!'
        buttonAction: => cast 'book.openCheckout'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='realness'>
            <div>
              it’s time for over-the-top <l.zon>realness</l.zon>
              to shock the <l.zon>conscience</l.zon> of our nation
            </div>
          </l.Pot>
        buttonText: 'sample the book'
        buttonAction: c.GoogleBookPreview
      }
      {
        render: (p) =>
          <Image name='back cover sd.jpg' className='fullHeight' onLoad={p.markLoaded} />
        buttonText: 'get the book'
        buttonAction: => cast 'book.openCheckout'
      }
      {
        render: (p) =>
          <Image name='girlish.jpg' onLoad={p.markLoaded} />
        buttonText: 'instagram'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          <Image name='child with sign.jpg' className='fullHeight' onLoad={p.markLoaded} />
        buttonText: 'youtube'
        buttonAction: c.YouTubeUrl
      }
      {
        render: (p) =>
          <Image name='merman 1.jpg' onLoad={p.markLoaded} />
        buttonText: 'instagram'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          <Image name='nonviolent revolution small.png' className='revo' onLoad={p.markLoaded} />
        buttonText: 'i’m into it'
        buttonAction: => cast 'book.openCheckout'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot>
            <MailingList disabled={p.disabled} />
          </l.Pot>
        buttonText: 'why join?'
        buttonAction: 'https://medium.com/@skitzysandcastle/in-the-beginning-was-the-end-88c928e7d3aa'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='scroll'>
            <img src={c.SRC_URL + 'commons/solwhite.png'} />
            <div>
              scroll down for more
            </div>
            <div>▼</div>
          </l.Pot>
        buttonText: 'let’s go'
        buttonAction: =>
          document.getElementById('scroll-root').scroll top: innerHeight, behavior: 'smooth'
      }
    ]}
  />

export Flitter = =>
  <Deck id='flitter'
    title={=> <>flitters</>}
    loading={=> <>beading some heels...</>}
    cards={[
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='getpaid'>
            what if you could work<br />
            anywhere, anytime,<br/>
            doing almost anything<br/>
            <l.zon>& get paid for it?</l.zon>
          </l.Pot>
        buttonText: 'tell me more'
        buttonAction: 'https://medium.com/@skitzysandcastle/flitters-497f7c33aa96'
      }
      {
        render: (p) =>
          <Image name='glitterfaeries.jpg' onLoad={p.markLoaded} />
        buttonText: 'roving art'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='flitpitch'>
            <div>
              imagine millions of flitters roaming america, being society’s antidepressant. that’s their job. stirring happiness & deescalating high-pressure situations.
            </div>
          </l.Pot>
        buttonText: 'sample the book'
        buttonAction: c.GoogleBookPreview
      }
      {
        render: (p) =>
          <Image
            name='flitsis.jpg'
            className='fullHeight'
            onLoad={p.markLoaded}
            />
        buttonText: 'sign me up!'
        buttonAction: FlitterFormUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='job'>
            <div>
              job description:<br/>
              <l.zon>spread joy & knowledge</l.zon>
            </div>
          </l.Pot>
        buttonText: 'i’m in'
        buttonAction: FlitterFormUrl
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
        buttonAction: FlitterFormUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='tough'>
            <div>
              <l.zon>flitters</l.zon>
              facilitate tough dialogues<br/>
              with levity & light
            </div>
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: FlitterFormUrl
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
          useEffect p.markLoaded, []
          <l.Pot className='yoga'>
            <div>
              <l.zon>flitters</l.zon>
              play dress up & do makeovers
            </div>
          </l.Pot>
        buttonText: 'sign me up!'
        buttonAction: FlitterFormUrl
      }
      {
        render: (p) =>
          <Image
            name='mikeyfizzwhimzeh.jpg'
            className='fullHeight'
            onLoad={p.markLoaded}
          />
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
        buttonAction: FlitterFormUrl
      }
    ]}
  />

export Lampshade = =>
  <Deck id='lampshade'
    title={=> <div>lampshade<l.yow> country club</l.yow></div>}
    loading={=> <>pulling some espresso...</>}
    cards={[
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='flitandland'>
            <div><l.zon>community&nbsp;</l.zon>meet<l.zon>&nbsp;commodity</l.zon></div>
          </l.Pot>
        buttonText: 'get a taste'
        buttonAction: 'https://medium.com/@skitzysandcastle/the-era-of-lampshade-89594f16386c'
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='exist'>
            expansive public space to simply <l.zon>exist</l.zon>
          </l.Pot>
        buttonText: 'liberate the static'
        buttonAction: => cast 'book.openCheckout'
      }
      {
        render: (p) =>
          <Image name='lampshade warm.jpg' onLoad={p.markLoaded} />
        buttonText: 'see more'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='flitpitch'>
            <div>
              public space where anyone from anywhere can go at any time for any reason whatever. we have a chance to make all people feel iconic. directly a part of it. in the heat.
            </div>
          </l.Pot>
        buttonText: 'read more'
        buttonAction: c.GoogleBookPreview
      }
      {
        render: (p) =>
          <Image name='lampshade.jpg' onLoad={p.markLoaded} />
        buttonText: 'moooore'
        buttonAction: c.InstagramUrl
      }
    ]}
  />

export EymU = =>
  <Deck id='eymu'
    title={=> <div>eym<l.yow>u</l.yow></div>}
    loading={=> <>solving some integrals...</>}
    cards={[
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='shock'>
            <div>
              mindful capitalism
            </div>
          </l.Pot>
        buttonText: 'read more'
        buttonAction: c.TwitterUrl
      }
      {
        render: (p) =>
          <Image name='eym.jpg' onLoad={p.markLoaded} />
        buttonText: 'see more'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='flitpitch volunteer'>
            <l.al>communally owned<br/>means of production</l.al>
            <div>
              maybe you donate two hours of sweeping the space every week and that’s how you get access. maybe you offer the temple space a guided meditation twice a week and that’s how you get access. maybe you’re a caretaker for the 7th floor glass-dome garden managing 200 weekly volunteers and that’s how you get access. maybe you’re rich as hell and give a million dollars.—
            </div>
          </l.Pot>
        buttonText: 'read more'
        buttonAction: c.GoogleBookPreview
      }
      {
        render: (p) =>
          <Image name='ice.jpg' onLoad={p.markLoaded} />
        buttonText: 'see more'
        buttonAction: c.InstagramUrl
      }
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='hollywood'>
            <div>
              <l.zon>hollywood</l.zon>
              heads to the<br/>
              <l.zon>heartland</l.zon>
            </div>
          </l.Pot>
        buttonText: 'get the book'
        buttonAction: => cast 'book.openCheckout'
      }
    ]}
  />

export Creation = =>
  <Deck id='creation'
    title={=> <div>creation&nbsp;<l.yow>poetcards</l.yow></div>}
    loading={=> <>mixing some paint...</>}
    cards={[
      {
        render: (p) =>
          useEffect p.markLoaded, []
          <l.Pot className='whimsy'>
            <div>
              <l.zon>cling to your whimsy</l.zon>
              you are a delightful stimulant<br/>
              when in doubt, make art
            </div>
          </l.Pot>
        buttonText: 'etsy get some'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) =>
          <Image name='dreams+of+lucy.jpg' className='fullHeight' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'bloom baby'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name='the+flight+home.jpg' className='fullHeight' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'stick out'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name='camus cabaret.jpg' className='fullHeight' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'it can only be right'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name="moby's+dick.jpg" root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'collapse the dark'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name='train+hoppin+charlie.jpg' className='fullHeight' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'peace, forget the rest'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name='prance.jpg' className='fullHeight' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'when in doubt, prance'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name='be+your+own+therapy.jpg' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'be your own therapy'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name='submerged+explorations.jpg' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'you are the guru'
        buttonAction: c.EtsyUrl
      }
      {
        render: (p) => <Image name='unicorn-merman.jpg' root='poetcards/' onLoad={p.markLoaded} />
        buttonText: 'be you'
        buttonAction: c.EtsyUrl
      }
    ]}
  />

export Footer = =>
  <l.Centered className='bottom'>
    <div className='book-link'>
      <a onClick={=> cast 'book.openCheckout'}>
        get the new book!
      </a>
    </div>
    <a href={c.MediumUrl} target='_blank'>
      <i className='fab fa-medium-m' />
    </a>
    <a href={c.InstagramUrl} target='_blank'>
      <i className='fab fa-instagram' />
    </a>
    <a href={c.YouTubeUrl} target='_blank'>
      <i className='fab fa-youtube' />
    </a>
    <a href={c.TwitterUrl} target='_blank'>
      <i className='fab fa-twitter' />
    </a>
    <l.woo className='footer-brand'>express your mess</l.woo>
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
#     <Tickle inView={inView} to='https://medium.com/@skitzysandcastle'>
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
