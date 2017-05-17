<election-result class="nrwelmaps__election-result --y{ opts.year }">

  <span class="nrwelmaps__election-result__title">Ergebnis { opts.year }</span>

  <div class="nrwelmaps__election-result__bar-container">
    <div class="nrwelmaps__election-result__bar-wrapper">
      <div each={ party in data } class="nrwelmaps__election-result__bar"
        style="width:{ party.width }%;background-color:{ party.color }"></div>
    </div>
  </div>

  this.colors = {
    spd: "#ff0d0d",
    cdu: "black",
    gruene: "#11bf11",
    fdp: "#ffe70c",
    linke: "#d50c70",
    afd: "steelblue",
    piraten: "#ff6f10",
  }

  this.on('update', () => {
    this.data = this.getData()
  })

  this.getData = () => {
    return Object.keys(this.colors).map(k => {
      return {
        width: this.opts.data[`${k}${this.opts.year == '2012' ? '12' : ''}`],
        color: this.colors[k]
      }
    })
  }

  this.data = this.getData()

</election-result>

