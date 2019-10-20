const DefaultAspectRatio = 16/9

export const cx = classMap => (
  Object.keys(classMap).filter(c => !!classMap[c]).join(' ')
)

export const getMediaSize = (maxWidth, aspectRatio = DefaultAspectRatio) => {
  const width = Math.min(window.innerWidth * .9, maxWidth)
  return {
    height: width * (1 / aspectRatio),
    width,
  }
}
