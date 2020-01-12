export function after(timeout, fn) {
  const id = setTimeout(fn, timeout)
  return {
    id,
    clear: () => clearTimeout(id),
  }
}

export function makeEnum(valueArray) {
  return valueArray.reduce((modeMap, mode) => (modeMap[mode] = mode) && modeMap, {})
}

window.after = after
window.makeEnum = makeEnum
window.dispatch = (eventName, props) => {
  let event = null
  if (props) {
    event = new CustomEvent(eventName, {detail: props})
  } else event = new Event(eventName)
  dispatchEvent(event)
}
window.listen = addEventListener
window.deafen = removeEventListener
window.every = (timeout, fn) => {
  const id = setInterval(fn, timeout)
  return {
    id,
    clear: () => clearInterval(id)
  }
}
