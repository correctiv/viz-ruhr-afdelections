import * as d3 from '../../scripts/lib/d3.js'

export default ({
  data,
  config
}) => {
  const {topoLayerName, width, height} = config
  const path = d3.geoPath().projection(d3.geoMercator().fitSize([width, height], data))
  const element = d3.select('[data-d3="d3-map"]')
  element.append('h4')
    .text('So hat NRW die AfD gewählt')
  return element.append('svg')
      .attr('preserveAspectRatio', 'xMinYMin meet')
      .attr('viewBox', '0 0 ' + width + ' ' + height)
      .attr('class', 'nrwelmaps__map-svg')
    .append('g')
      .attr('class', 'nrwelmaps__map-g')
    .selectAll('path').data(data.features).enter().append('path')
      .attr('class', 'nrwelmaps__map-path')
      .attr('d', path)
      .attr('fill', f => f.color)
}
