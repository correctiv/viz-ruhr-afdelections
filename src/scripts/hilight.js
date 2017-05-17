export default selection => {
  selection.classed('-hilight', true)
  const node = selection.node()
  node.parentNode.appendChild(node)
}
