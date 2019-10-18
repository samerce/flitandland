import React, {useState} from 'react'

import {
  Root, Table, TabBar, TabItem, TableItem, Body, TableItemsRoot
} from './styled'
import {
  SectionHeader, Button,
} from '../../global-styles'

import TableItems from './config'

Tabs = Object.keys TableItems

export default TreasureChest = =>
  [activeTab, setActiveTab] = useState 'happenings'
  hasSides = (index) => (index + 1) % 3 is 2
  hasTop = (index) => index > 2

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
            className={'active' if activeTab is tab}
            onClick={() => setActiveTab(tab)}>
            {tab}
          </TabItem>
        }
      </TabBar>

      <TableItemsRoot>
        {TableItems[activeTab].map (item, i) =>
          <TableItem
            className={
              (if hasSides(i) then ' sideBorders ') +
              (if hasTop(i) then ' topBorders ') + ''
            }
            key={item.title}>
            {item.title}
          </TableItem>
        }
      </TableItemsRoot>
    </Table>

    <Button>
      {'add an idea!' if activeTab is 'ideas'}
      {'create a happening!' if activeTab is 'happenings'}
      {'offer a resource!' if activeTab is 'resources'}
    </Button>
  </Root>
