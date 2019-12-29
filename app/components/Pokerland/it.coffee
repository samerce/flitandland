import React from 'react'

import l from './styled'
import * as c from '../../constants'
import config from './config'

import useNav from '../../hooks/useNav.coffee'

Row = (p) =>
  <l.Row>
    <l.Decor>
      <l.Docent src={p.docent} />
      <l.Cards src={p.cards} />
    </l.Decor>

    <l.Content>
      {p.renderContent()}
    </l.Content>
  </l.Row>

export default Pokerland = =>
  [{view}, Nav] = useNav()
  <l.Root className={(view is 'poker') and 'show'}>
    {config.map (row) => <Row {...row} key={row.docent} />}
  </l.Root>
