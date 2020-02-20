import React from 'react'

import {cx} from '../../utils/style'
import {useInView} from 'react-intersection-observer'

import l from './styled'
import * as c from '../../constants'

export default QuickHit = =>
  [ref, inView] = useInView threshold: .7, triggerOnce: yes
  <l.Root ref={ref} className={cx show: inView}>
    <l.Time><div>it’s time</div></l.Time>
    <l.For><div>for</div></l.For>
    <l.Ott><div>over-the-top</div></l.Ott>
    <l.Real><div>realness</div></l.Real>
    <l.To><div>to</div></l.To>
    <l.Shock><div>shock</div></l.Shock>
    <l.The><div>the</div></l.The>
    <l.Conscience><div>conscience</div></l.Conscience>
    <l.Of><div>of</div></l.Of>
    <l.Nation><div>our nation</div></l.Nation>
  </l.Root>
