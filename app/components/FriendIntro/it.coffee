import React, {useState, useLayoutEffect} from 'react'

import l from './styled'
import * as c from '../../constants'
import useIntro from '../../hooks/useIntro.coffee'
import useLoader from '../Bopz/useLoader.coffee'
import {useSpring, animated} from 'react-spring'

export default FriendIntro = =>
  [{isIntro}, {setIsIntro}] = useIntro()
  [{isLoaded}] = useLoader()
  [anim, setAnim] = useState
    from: {opacity: 0, transform: 'translate(0, 100%)'}
    to: {opacity: 1, transform: 'translate(0, 0)'}
    delay: 4000
  style = useSpring {...anim}

  useLayoutEffect (=> listen 'fal.bgWasClicked', =>
    return unless isIntro
    setIsIntro no
    setAnim
      from: {opacity: 1, transform: 'translate(0, 0)'}
      to: {opacity: 0, transform: 'translate(0, 100%)'}
  ), []

  <l.Root>
    {if isLoaded
      <l.Go style={style}><div>touch me</div></l.Go>
    else
      <l.Go style={style}>
        <i className='fa fa-spinner' />
        <div>still decorating, gimme a sec...</div>
      </l.Go>
    }
  </l.Root>
