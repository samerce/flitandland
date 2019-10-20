import React from 'react'

import {
  Root, MatrixItem, PeopleImage, Body, Subheader, Icon, MatrixImageRoot, MatrixImage,
} from './styled'
import {
  SectionHeader, Matrix, MatrixItemContent, MatrixItemIcon, MatrixItemText,
  MatrixItemTitle, E,
} from '../../global-styles'

import {FAL_URL} from '../../constants'

export default Support = =>
  <Root id='support'>
    <SectionHeader>{"life's (a) play!"}</SectionHeader>
    <Subheader className='antony'>cast yourself well.<span>🧚🏽‍♀️</span></Subheader>
    <Body>
      no matter who you are, you can flit and land with us!<br/>
      to knight yourself a flitterer & join our (not-really) secret, ethereal,  wispy little club, feel free to pick up and put down any of the game pieces below for as long as or as little as you like!
    </Body>
    <Subheader className='bolois'><span>💃🏽</span>flitter fabulously!</Subheader>

    <PeopleImage src={FAL_URL + 'moving-people.png'} />

    <Matrix>
      <MatrixItem>
        <MatrixImageRoot>
          <MatrixImage src={FAL_URL + 'millyflitty.jpg'} />
          <Icon>🦄</Icon>
        </MatrixImageRoot>
        <MatrixItemContent>
          <MatrixItemTitle>flitterers</MatrixItemTitle>
          <MatrixItemText>
            <E>bundles of love & ecstasy!<br/><br/></E>
            these fantastic creatures flit around, dropping a bit of love here, a splash of humor there, a spritz of shade there, a dash of insanity here.<br/><br/>
            embracing <E>schizo</E>, they keep the gears turning and the fires burning!
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem className='right'>
        <MatrixImageRoot>
          <MatrixImage src={FAL_URL + 'binchesinlove.jpg'} />
          <Icon>🏄🏽‍♀️</Icon>
        </MatrixImageRoot>
        <MatrixItemContent>
          <MatrixItemTitle>surfers</MatrixItemTitle>
          <MatrixItemText>
            <E>these rad folks say yes to everything. the secret to their endless radiance? obsessive awareness.<br/><br/></E>
            every hour from sunrise to midnight is full. scheduled. they know what they like and they build their lives around it. {"they're"} invigorated by travel and exploration and {"that's"} why they benevolently sponsor our lotteries, giving <E>four random flitterers a month</E> trips to other states to cross-pollinate americans from coast to coast!<br/><br/>
            all while singing opera on a unicycle juggling fifteen piglets! 🐷
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem>
        <MatrixImageRoot>
          <MatrixImage src={FAL_URL + 'indecisivesasquatch.jpg'} />
          <Icon>🐒</Icon>
        </MatrixImageRoot>
        <MatrixItemContent>
          <MatrixItemTitle>collectors</MatrixItemTitle>
          <MatrixItemText>
            <E>these perfect peculiar penguins usually have that bandaid in their purse just when you need it.<br/><br/></E>
            they probably have tons of unused STUFF. art supplies all over the house, maybe some juggling pins and recording equipment in the garage, perhaps a car—a shiny macbook air tossing blinding rays off its soft shell from the front seat—that just sits in the driveway, sad it never gets to go anywhere. <br/><br/>
            their donations make it possible for us to create street spectacles that rival the mightiest hollywood blockbuster!
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem className='right'>
        <MatrixImageRoot>
          <MatrixImage src={FAL_URL + 'what/SERVE HENNY!cutestfaerie.jpg'} />
          <Icon>🐝</Icon>
        </MatrixImageRoot>
        <MatrixItemContent>
          <MatrixItemTitle>queens</MatrixItemTitle>
          <MatrixItemText>
            <E>royalty cares for its people with fabulous grandeur, import, and finesse!<br/><br/></E>
            flittering queens fund our local chapters so thoroughly that flitterers can flit and land full time! so long 9-to-5 suckery! 🤙
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>

      <MatrixItem>
        <MatrixImageRoot>
          <MatrixImage src={FAL_URL + 'thepolitician.jpg'} />
          <Icon>🦋</Icon>
        </MatrixImageRoot>
        <MatrixItemContent>
          <MatrixItemTitle>politicians</MatrixItemTitle>
          <MatrixItemText>
            <E>thinkers solve the big problems.</E><br/><br/>
            politicians bring our grandest collective dreams into reality. they brainstorm, motivate, guide & protect.
          </MatrixItemText>
        </MatrixItemContent>
      </MatrixItem>
    </Matrix>
  </Root>
