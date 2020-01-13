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
window.dispatch = window.cast = (eventName, props) => {
  let event = null
  if (props) {
    event = new CustomEvent(eventName, {detail: props})
  } else event = new Event(eventName)
  dispatchEvent(event)
}
window.listen = window.upon = (event, listener) => {
  return addEventListener(event, (e) => {
    if (e.detail) listener(e.detail, e)
    else listener(e)
  })
}
window.deafen = window.end = removeEventListener
window.every = (timeout, fn) => {
  const id = setInterval(fn, timeout)
  return {
    id,
    clear: () => clearInterval(id)
  }
}
