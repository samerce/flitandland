export function openInNewTab(url) {
  const a = document.createElement('a')
  document.body.appendChild(a)
  a.href = url
  a.target = '_blank'
  a.click()
  document.body.removeChild(a)
}

const ScrollOptions = {
  behavior: 'smooth',
}
export function scrollIntoView(idOrElement) {
  let element = idOrElement
  if (typeof idOrElement === 'string') {
    element = document.getElementById(idOrElement)
  }
  element.scrollIntoView(ScrollOptions)
}
