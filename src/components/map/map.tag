import '../legend/legend.tag'
import renderMap from './render_map.js'
import hilight from '../../scripts/hilight.js'

<nrwelmaps-map class="nrwelmaps__map-wrapper">

  <div data-d3="d3-map" class="nrwelmaps__map-container"></div>

  <nrwelmaps-legend steps={ opts.config.steps } colors={ opts.config.colors } />

  this.on('mount', () => {
    this.selection = renderMap(this.opts)
    this.selection.on('mouseover', f => {
      riot.control.trigger(riot.EVT.mapMouseover, f)
    })
  })

  riot.control.on(riot.EVT.mapHilight, d => {
    this.hilight(this.selection.filter(_d => _d === d))
  })

  this.hilight = selection => {
    this.hilighted && this.hilighted.classed('-hilight', false)
    this.hilighted = selection
    hilight(selection)
  }

</nrwelmaps-map>
