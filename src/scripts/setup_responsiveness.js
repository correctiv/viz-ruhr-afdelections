const BP = {  // FIXME this should go into config.json
  small: 768,
  medium: 992,
  large: 1200
}

const getBreakpoint = () => {
  const w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0],
    width = w.innerWidth || e.clientWidth || g.clientWidth
  return Object.keys(BP).find(k => BP[k] > width)
}

riot.STATE.breakpoint = getBreakpoint()

window.addEventListener('resize', () => {
  const bp = getBreakpoint()
  if (riot.STATE.breakpoint !== bp) {
    riot.STATE.breakpoint = bp
    riot.control.trigger(riot.EVT.breakpointChange, bp)
  }
})
