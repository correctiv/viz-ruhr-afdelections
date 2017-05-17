import './district.tag'

<nrwelmaps-districts class="nrwelmaps__districts-container">

  <div class="nrwelmaps__districts-group"
    each={ group in getGroups() }>
    <h3 class="nrwelmaps__districts-group-title">
      { group.label }
    </h3>

    <nrwelmaps-district
      each={ feature in group.features }
      feature={ feature }
      breakpoint={ parent.opts.breakpoint }
      active={ feature.data.id === parent.active }
    />

  </div>

  this.active = null

  riot.control.on(riot.EVT.updateSelectedDistrict, ({data}) => {
    this.update({active: data.id})
  })

  riot.control.on(riot.EVT.emptyInfobox, () => {
    this.update({active: null})
  })

  this.getGroups = () => {
    const features = this.opts.data.features
    const high = features.filter(f => f.data.g == '+').sort((a, b) => (b.data.afd - a.data.afd))
    const low = features.filter(f => f.data.g == '-').sort((a, b) => (a.data.afd - b.data.afd))
    if (this.opts.breakpoint == 'medium' || this.opts.breakpoint == 'small') {
      return [{
        label: 'Die 10 stärksten Wahlkreise',
        features: high.slice(0, 10)
      }, {
        label: 'Die 10 schwächsten Wahlkreise',
        features: low.slice(0, 10)
      }]
    } else {
      return [{
        label: 'Zweitstimme über 10 Prozent',
        features: high
      }, {
        label: 'Zweitstimme unter 5 Prozent',
        features: low
      }]
      }
    }
</nrwelmaps-districts>
