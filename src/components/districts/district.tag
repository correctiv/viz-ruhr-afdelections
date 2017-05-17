import * as d3 from '../../scripts/lib/d3.js'
import renderDistrict from './render_district.js'

<nrwelmaps-district
  onmouseover={ selectDistrict }
  class="nrwelmaps__district-container
  { nrwelmaps__district-container--active: opts.active}">

  <div data-d3="district-{ data.id }"
    class="nrwelmaps__district-map__container"></div>
  <h4 class="nrwelmaps__district__name">{ data.n }</h4>
  <span class="nrwelmaps__district__inline-data"><strong>{ data.afd }&nbsp;%</strong></span>
  <button class="btn nrwelmaps__district__collapse-btn
    { nrwelmaps__district__collapse-btn--active: opts.active}"
    disabled={ opts.active }
    onclick={ selectDistrict }>Infos</button>

  this.data = this.opts.feature.data

  this.on('mount', () => {
    renderDistrict({
      feature: this.opts.feature,
      selection: d3.select(`[data-d3="district-${this.data.id}"]`)
    })
  })

  this.selectDistrict = () => {
    riot.control.trigger(riot.EVT.selectDistrict, this.opts.feature)
  }

</nrwelmaps-district>
