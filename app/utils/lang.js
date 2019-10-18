export function after(timeout, fn) {
  const id = setTimeout(fn, timeout)
  return {
    id,
    clear: () => clearTimeout(id),
  }
}
