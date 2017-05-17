import * as topojson from 'topojson'

const geoSource = require('json!../data/lwk_nrw.simplified.topo.json')  // FIXME config.json
const afdData = require('json!../data/afd_results.json')

export default ({
  topoLayerName,
  colors
}) => {
  const data = topojson.feature(geoSource, geoSource.objects[topoLayerName])
  data.features.map(f => {
    const id = f.properties.LWKNR
    f.data = afdData[id],
    f.data.id = id,
    f.data.wb = Math.round(f.data.w / f.data.b * 100)
    f.color = colors[+f.data.c]
  })
  return data
}
