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
  slightlyDark: purpleSlightlyDark,
  slightlyLight: purpleSlightlyLight,
  veryDark: purpleVeryDark,
  veryLight: purpleVeryLight,
  semiWhite: lighten(0.2, purpleVeryLight),
  shadowVeryHeavy: `3px 20px 40px ${alpha(0.7, purpleVeryDark)}`,
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
  sexyEdge: `0 0 0 1px ${alpha(.5, susan)},
    0 0 0 2px ${alpha(.5, susanVeryDark)}`,
}
