import React, {useState} from 'react'

import {
  Root, Table, TabBar, TabItem, TableItem, Body, TableItemsRoot, TravelLotteryRoot,
} from './styled'
import {
  SectionHeader, Button, Subheader, E,
} from '../../global-styles'

import TableItems from './config'

Tabs = Object.keys TableItems

export default TreasureChest = =>
  [activeTab, setActiveTab] = useState 'flitterings'
  hasSides = (index) => (index + 1) % 3 is 2
  hasTop = (index) => index > 2

  <Root id='treasure'>
    <SectionHeader>treasure chest</SectionHeader>
    <Body>
      the nexus.<br />everything you need to flitter your streets.<br />
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
      {'create a flittering!' if activeTab is 'flitterings'}
      {'offer a resource!' if activeTab is 'resources'}
      {'tell your story!' if activeTab is 'stories'}
    </Button>

    <TravelLotteryRoot>
      <Subheader>travel lottery winners</Subheader>
      <Body><E>koki khan</E></Body>
      <Body><E>thomas brosy</E></Body>
      <Body><E>danella mikey</E></Body>
      <Body><E>rameen chahine</E></Body>
    </TravelLotteryRoot>
  </Root>
