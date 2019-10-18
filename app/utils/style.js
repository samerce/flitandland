export const cx = classMap => (
  Object.keys(classMap).filter(c => !!classMap[c]).join(' ')
)

export const getMediaSize = maxWidth => {
  const width = Math.min(window.innerWidth * .9, maxWidth)
  return {
    height: width * (9/16),
    width,
  }
}
