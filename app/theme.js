import { darken, lighten, transparentize as alpha } from 'polished';

// #512287 #334ac7 #238386 #1b316b, #f9690c, #069648
const main = '#542263';
const purpleVeryDark = darken(0.2, main);
const purpleSlightlyDark = darken(0.05, main);
const purpleVeryLight = lighten(0.35, main);
const purpleSlightlyLight = lighten(0.05, main);

const flik = '#053629' // '#204017'
const dali = '#542263'
const myrtle = '#71201b'
const shelly = '#721e77'
const tweet = '#c34d30' // '#cfb405'
const pram = '#eee508'
const hopi = '#FF7519'
const susan = '#f9ebf6'
const susanDark = '#7a0b67'
const susanVeryDark = darken(.2, susanDark)
const susanLight = lighten(.1, susan)

// const ann = '#148E99'
// const ben = '#FF863E'
// const cal = '#FF5037'
// const dan = '#F0224F'
// const eli = '#D10079'
// const ann = '#0084A9'
// const ben = '#4588A7'
// const cal = '#D2EDF7'
// const dan = '#EEF1FF'
// const eli = '#F1FFFF'
const ann = '#9B06D6'
const ben = 'white'
const cal = '#9B06D6'
const dan = '#05040D'
const eli = '#9B06D6'

export const getRandomColor = () => {
  const rand = Math.random();
  if (rand < 0.3) {
    return flik;
  }
  if (rand >= 0.3 && rand <= 0.6) {
    return dali;
  }
  return myrtle;
}

export default {
  main,
  susan,
  susanDark,
  susanVeryDark,
  susanLight,
  ann, ben, cal, dan, eli,
  slightlyDark: purpleSlightlyDark,
  slightlyLight: purpleSlightlyLight,
  veryDark: purpleVeryDark,
  veryLight: purpleVeryLight,
  semiWhite: lighten(0.2, purpleVeryLight),
  shadowVeryHeavy: `3px 20px 40px ${alpha(0.3, susanVeryDark)}`,
  shadowHeavy: `3px 10px 20px ${alpha(0.7, purpleVeryDark)}`,
  shadowMedium: `2px 5px 10px ${alpha(0.8, purpleVeryDark)}`,
  shadowLight: `2px 2px 8px ${alpha(0.9, purpleVeryDark)}`,
  borderRadiusBoto: 70,
  emphasis: '#d64f31',
  shelly,
  shellyLight: lighten(0.3, shelly),
  shellyDark: darken(0.2, shelly),
  flik,
  flikLight: lighten(0.3, flik),
  flikSemiLight: lighten(0.2, flik),
  flikDark: darken(0.2, flik),
  dali,
  daliLight: lighten(0.3, dali),
  daliDark: darken(0.2, dali),
  myrtle,
  myrtleLight: lighten(0.3, myrtle),
  myrtleDark: darken(0.2, myrtle),
  tweet,
  tweetLight: lighten(0.3, tweet),
  tweetDark: darken(0.2, tweet),
  pram,
  pramLight: lighten(0.3, pram),
  pramDark: darken(0.2, pram),
  hopi,
  hopiLight: lighten(0.3, hopi),
  hopiDark: darken(0.2, hopi),
  gradientVeryDarkButTransparent: `radial-gradient(
    circle at center,
    ${alpha(0.17, purpleSlightlyDark)} 0%,
    ${alpha(0.17, purpleVeryDark)} 50%,
    ${alpha(0.17, purpleVeryDark)} 100%
  )`,
  gradientVeryDark: `radial-gradient(
    circle at center,
    ${purpleSlightlyDark} 0%,
    ${purpleVeryDark} 50%,
    ${purpleVeryDark} 100%
  )`,
  linearGradient: c => `linear-gradient(to bottom, transparent 0%, ${c} 100%)`,
  veryDarkTransparent: alpha(0.4, purpleVeryDark),
  gradientSunset:
    'linear-gradient(to bottom, #4771a3 0%, #77779d 40%, #b998b3 65%, #e7a8b1 85%, #fdefb0 100%)',
  sexyEdge: `0 0 0 1px ${alpha(.2, 'white')},
    0 0 0 2px ${alpha(.2, 'black')}`,
  pinkGradient: `linear-gradient(
    to bottom, rgba(255, 0, 237, 0.79) 0%, rgba(255, 0, 176, 0.8) 5%, rgba(201, 23, 173, 0.81) 50%, rgba(184, 0, 149, 0.8) 95%, rgba(193, 0, 133, 0.8) 100%
  )`,
  gradient: `linear-gradient(
    45deg, ${eli} 0%, ${cal} 50%, ${eli} 100%
  )`,
  blackGradient: `linear-gradient(
    to bottom, rgb(43, 43, 43) 0%, rgba(50, 49, 49, 1) 5%, rgba(31, 31, 31, 1) 50%, rgba(24, 24, 24, 1) 95%, rgba(0, 0, 0, 1) 100%
  )`,
  prettyFrame: `0 0 0 1px white, 0 0 0 2px black, 0 0 0 4px ${ann}, 0 0 0 6px ${ben}, 0 0 0 7px ${cal}, 0 0 0 9px ${dan}, 0 0 0 11px black, 0 0 0 14px white`,
}
