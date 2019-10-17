import React from 'react'

import {
  Root, MatrixItem, PeopleImage,
} from './styled'
import {
  SectionHeader, Body, Matrix, MatrixItemContent, MatrixItemIcon, MatrixItemText,
  MatrixItemTitle,
} from '../../global-styles'

import {SRC_URL} from '../../constants'

export default class Support extends React.PureComponent

  render: =>
    <Root id='support'>
      <SectionHeader>support the love revolution</SectionHeader>
      <Body>
        flit and land is a not-for-profit community aimed at bridging the divides in our country and refocusing human effort on love & joy instead of competition & sacrifice.
      </Body>

      <PeopleImage src={SRC_URL + 'flitandland/moving-people.png'} />

      <Matrix>
        <MatrixItem>
          <MatrixItemIcon className='fas fa-hand-holding-heart' />
          <MatrixItemContent>
            <MatrixItemTitle>SPONSOR</MatrixItemTitle>
            <MatrixItemText>
              travel is the biggest contributer to emotional growth. sponsor a travel lottery to offer flitterers regular opportunities to fly to different states, learn about people from different places, spread their love and joy to foreign streets, and build powerful new empathy in a time where hate threatens our unity.
            </MatrixItemText>
          </MatrixItemContent>
        </MatrixItem>

        <MatrixItem>
          <MatrixItemContent className='right'>
            <MatrixItemTitle>DONATE</MatrixItemTitle>
            <MatrixItemText>
              media consumption is rotting our brains. we can make our own spectacle every day in our own communities! donate materials—art supplies, recording equipment, circus toys, cars, computers, anything—to help flitterers create the most magnificent displays of love and absurdity that can rival {"hollywood's"} best blockbuster!
            </MatrixItemText>
          </MatrixItemContent>
          <MatrixItemIcon className='fas fa-box-open' />
        </MatrixItem>

        <MatrixItem>
          <MatrixItemIcon className='far fa-money-bill-alt' />
          <MatrixItemContent>
            <MatrixItemTitle>FUND</MatrixItemTitle>
            <MatrixItemText>
              we can end the scourge of 9-to-5 jobs that suck our souls. fund a chapter in your state to pay people to spread love, joy, and knowledge on the streets rather than being stuck behind a desk or inside a factory.
            </MatrixItemText>
          </MatrixItemContent>
        </MatrixItem>

        <MatrixItem>
          <MatrixItemContent className='right'>
            <MatrixItemTitle>BRAINSTORM</MatrixItemTitle>
            <MatrixItemText>
              you can help us guide this movement. join our digital town square and brainstorm with us to decide what we do next. or just shoot us a message if you have an idea you wanna share.
            </MatrixItemText>
          </MatrixItemContent>
          <MatrixItemIcon className='fas fa-lightbulb' />
        </MatrixItem>
      </Matrix>
    </Root>
