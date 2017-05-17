import * as d3 from '../../scripts/lib/d3.js'
import renderSymbol from '../districts/render_district.js'
import './election-result.tag'

<nrwelmaps-infobox class="nrwelmaps__infobox-wrapper">

  <div if={ feature } class="nrwelmaps__infobox">
    <h3 class="nrwelmaps__infobox-title">{ feature.data.n }</h3>
    <span class="nrwelmaps__infobox__annotation { nrwelmaps__infobox__annotation--visible: feature.data.n12 }">(2012: { feature.data.n12 })</span>
    <dl>
      <dt>{ feature.data.afd }&nbsp;%</dt>
      <dd>Wahlergebnis AfD</dd>
    </dl>
    <dl>
      <dt>{ feature.data.wb }&nbsp;%</dt>
      <dd>Wahlbeteiligung<br><span class="annotation">2012: { feature.data.b12 }&nbsp;%</span></dd>
    </dl>

    <election-result data={ feature.data } year="2017" />
    <election-result data={ feature.data } year="2012" />

    <button class="btn nrwelmaps__infobox__close-btn"
      onclick={ close }>x</button>
    <div data-d3="map-symbol" class="nrwelmaps__infobox__map-symbol"></div>
  </div>

  <div if={ !feature && opts.breakpoint !== 'small'}
    class="nrwelmaps__infobox">
    <p class="nrwelmaps__infobox__hint">Wähle einen Wahlkreis aus der Liste links aus oder fahre mit der Maus (oder klicke mit Deinem Touchpad) über die Karte von NRW, um die Wahlergebnisse der AfD für einen Wahlkreis zu sehen.</p>
  </div>

  riot.control.on(riot.EVT.updateInfobox, feature => {
    this.update({feature})
    this.renderMapSymbol(feature)
  })

  riot.control.on(riot.EVT.emptyInfobox, () => {
    this.update({feature: null})
  })

  this.close = () => {
    if (this.opts.breakpoint === 'small') {
      riot.control.trigger(riot.EVT.closeInfobox)
    }
  }

  this.renderMapSymbol = feature => {
    const selection = d3.select('[data-d3="map-symbol"]')
    selection.selectAll('*').remove()
    renderSymbol({selection, feature})
  }

</nrwelmaps-infobox>
