import React, {useState, useLayoutEffect} from 'react'

import l from './styled'
import * as c from '../../constants'

import useBus from '../../hooks/useBus.coffee'
import {useInView} from 'react-intersection-observer'

Page = ({image, text, action}) =>
  [ref, inView] = useInView(threshold: .5)
  useLayoutEffect (=>
    cast('viewDidChange', action) if inView
  ), [inView]
  <l.Page image={image} ref={ref}>
    <l.PageText><l.little>{text}</l.little></l.PageText>
  </l.Page>

export default DuceLanding = =>
  [buttonText, setButtonText] = useState 'Explore our Work »'
  useBus
    viewDidChange: (buttonText) => setButtonText buttonText

  # onClickNavButton = (btn) =>
  #   section = document.querySelector('#' + btn)
  #   section.scrollIntoView({behavior: 'smooth'})

  <l.Root>
    <l.Header>
      <l.Svelte />
      <l.Title>duce</l.Title>
      <l.Subtitle>construction</l.Subtitle>
    </l.Header>

    <Page image='https://images.unsplash.com/photo-1531591022136-eb8b0da1e6d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2800&q=80'
    text='NY Museum of Science' action='Explore Our Work »' />

    <Page image='https://images.unsplash.com/photo-1451976426598-a7593bd6d0b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80' text='Hoffman Residences'
    action='News »' />

    <l.Footer>
      <l.Name>duce construction corporation<br/></l.Name>
      <l.Contact>
        412 WEST 127TH STREET<br/>
        NEW YORK, NY 10027<br/><br/>
        (212) 316-2400<br/>
        info@ducecc.com
      </l.Contact>
    </l.Footer>

    <l.ActionZone>
      <l.Svelte className='opp' />
      <l.ActionButton>{buttonText}</l.ActionButton>
    </l.ActionZone>
  </l.Root>

# <l.NextButton id='next' onClick={() => onClickNavButton 'next'}>▽</l.NextButton>
# <l.PrevButton id='prev' onClick={() => onClickNavButton 'prev'}>△</l.PrevButton>
