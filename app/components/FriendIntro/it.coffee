import React from 'react'

import l from './styled'
import * as c from '../../constants'
import useIntro from '../../hooks/useIntro.coffee'
import useLoader from '../Bopz/useLoader.coffee'

export default FriendIntro = =>
  [{isIntro}, {setIsIntro}] = useIntro()
  [{isLoaded}] = useLoader()
  <l.Root isIntro={isIntro}>
    {if isLoaded
      <l.Go onClick={=> setIsIntro no}>{"let's go!"}</l.Go>
    }
  </l.Root>
