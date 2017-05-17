<nrwelmaps-legend class="nrwelmaps__legend">

  <h4 class="nrwelmaps__legend-title">Zweitstimmenergebnis AfD</h4>
  <div class="nrwelmaps__legend-item" each={ step in opts.steps }>
    <span class="nrwelmaps__legend-color" style="background-color:{ parent.getColor(step) }" />
    <span class="nrwelmaps__legend-label
      { nrwelmaps__legend-label--black: parent.opts.steps.indexOf(step) < 2 }">{ step }&nbsp;%</span>
  </div>

  this.getColor = step => this.opts.colors[this.opts.steps.indexOf(step)]

</nrwelmaps-legend>
