import './map/map.tag'
import './districts/districts.tag'
import './infobox/infobox.tag'

<nrwelmaps-app class="nrwelmaps">

  <nrwelmaps-districts data={ opts.data } breakpoint={ breakpoint }/>
  <nrwelmaps-map config={ opts.config.map } data={ opts.data } breakpoint={ breakpoint } />
  <nrwelmaps-infobox breakpoint={ breakpoint } />

  this.breakpoint = riot.STATE.breakpoint

  riot.control.on(riot.EVT.breakpointChange, breakpoint => {
    this.update({breakpoint})
  })

</nrwelmaps-app>
