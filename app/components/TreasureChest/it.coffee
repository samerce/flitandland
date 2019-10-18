import React from 'react'

import {
  Root, Table, TabBar, TabItem, TableItem, Body,
} from './styled'
import {
  SectionHeader, 
} from '../../global-styles'

import TableItems from './config'

Tabs = Object.keys(TableItems)

export default class TreasureChest extends React.PureComponent

  constructor: (props) ->
    super(props)
    @state = {
      activeTab: 'ideas'
    }

  render: =>
    <Root id='treasure'>
      <SectionHeader>treasure chest</SectionHeader>
      <Body>
        ideas and resources to help you flit and land on your streets.<br />
        and happenings to help you join flitterings happening now all across the globe!
      </Body>

      <Table>
        <TabBar>
          {Tabs.map (tab) =>
            <TabItem
              className={if @state.activeTab is tab then 'active' else ''}
              onClick={() => @onClickTab(tab)}>
              {tab}
            </TabItem>
          }
        </TabBar>

        {TableItems[@state.activeTab].map (item, i) =>
          <TableItem
            className={
              (if @hasSides(i) then ' sideBorders ') +
              (if @hasTop(i) then ' topBorders ') + ''
            }
            key={item.title}>
            {item.title}
          </TableItem>
        }
      </Table>
    </Root>

  onClickTab: (tab) => @setState activeTab: tab
  hasSides: (index) => (index + 1) % 3 is 2
  hasTop: (index) => index > 2
