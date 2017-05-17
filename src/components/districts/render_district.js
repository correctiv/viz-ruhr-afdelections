import * as d3 from '../../scripts/lib/d3.js'

export default ({
  selection,
  feature
}) => {
  const [width, height] = [100, 100]
  const path = d3.geoPath().projection(d3.geoMercator().fitSize([width, height], feature))
  return selection.append('svg')
      .attr('preserveAspectRatio', 'xMinYMin meet')
      .attr('viewBox', '0 0 ' + width + ' ' + height)
      .attr('class', 'nrwelmaps__district-map-svg')
    .append('g')
      // .attr('transform', 'translate(5,5)')
      .attr('class', 'nrwelmaps__district-map-g')
    .selectAll('path').data([feature]).enter().append('path')
      .attr('class', 'nrwelmaps__district-map-path')
      .attr('d', path)
      .attr('fill', f => f.color)
}
