import '../components/comparison-charts/comparison-charts.tag'

const data = require('json!../data/overall_results.json')

const getData = (data1, data2) => {
  return Object.keys(data1).map(k => {
    return {
      label: data.parties[k],
      value1: +data1[k],
      value2: +data2[k] ? +data2[k] : null,
      color: data.colors[k]
    }
  })
}

riot.mount('[data-riot-mount="overall-comparison-2017"]', 'comparison-charts', {
  data: getData(data.rvr['2017'], data.nrw['2017']),
  label1: 'Ruhr',
  label2: 'NRW'
})

riot.mount('[data-riot-mount="rvr-comparison"]', 'comparison-charts', {
  data: getData(data.rvr['2017'], data.rvr['2012']),
  label1: '2017',
  label2: '2012'
})
