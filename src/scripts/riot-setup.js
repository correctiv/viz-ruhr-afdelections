// event names
const EVT = {
  selectDistrict: 'select_district',
  updateSelectedDistrict: 'update_selected_district',

  mapMouseover: 'map_mouseover',
  mapHilight: 'map_hilight',

  updateInfobox: 'update_infobox',
  closeInfobox: 'close_infobox',
  emptyInfobox: 'empty_infobox',

  breakpointChange: 'breakpoint_change'
}

// event bus
const C = riot.observable()

// payload: param `data` is always a single geojson feature
// from the initial geoData

// district select via list (hover or click)
C.on(EVT.selectDistrict, data => {
  C.trigger(EVT.updateInfobox, data)
  C.trigger(EVT.mapHilight, data)
  C.trigger(EVT.updateSelectedDistrict, data)
})

// close infobox via close-btn
C.on(EVT.closeInfobox, () => {
  C.trigger(EVT.emptyInfobox)
})

// map mouseover (also via click on mobile)
C.on(EVT.mapMouseover, data => {
  C.trigger(EVT.updateInfobox, data)
  C.trigger(EVT.mapHilight, data)
  C.trigger(EVT.updateSelectedDistrict, data)
})


// DEBUG
// C.on('*', (event, data) => {
//   console.log(event, data)
// })

// hold some global state
riot.STATE = {}

// make event bus global
riot.EVT = EVT
riot.control = C
