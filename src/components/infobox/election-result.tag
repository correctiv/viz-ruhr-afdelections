<election-result class="nrwelmaps__election-result --y{ opts.year }">

  <span class="nrwelmaps__election-result__title">Ergebnis { opts.year }</span>

  <div class="nrwelmaps__election-result__bar-container">
    <div class="nrwelmaps__election-result__bar-wrapper">
      <div each={ party in data } class="nrwelmaps__election-result__bar"
        style="width:{ party.width }%;background-color:{ party.color }"></div>
    </div>
  </div>

  <ul if={ opts.year === '2012' } class="nrwelmaps__election-result__legend">
    <li each={ party in Object.keys(colors) }
      class="nrwelmaps__election-result__legend-item">
      <span class="nrwelmaps__election-result__legend-item-square"
        style="background-color:{ parent.colors[party] };"></span>&nbsp;{ parent.parties[party] }
    </li>
  </ul>

  this.colors = {
    spd: "#ff0d0d",
    cdu: "black",
    gruene: "#11bf11",
    fdp: "#ffe70c",
    linke: "#d50c70",
    afd: "steelblue",
    piraten: "#ff6f10",
    sonstige: "gray"
  }

  this.parties = {
    spd: "SPD",
    cdu: "CDU",
    gruene: "Gr.",
    fdp: "FDP",
    linke: "Li.",
    afd: "AfD",
    piraten: "Pirat.",
    sonstige: "Sonst."
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

