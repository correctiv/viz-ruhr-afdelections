'use strict'

if (module.hot) {
  module.hot.accept()
}

// import 'babel-polyfill'
import '../styles/index.scss'

// riot
import './riot-setup.js'

// responsive
import './setup_responsiveness.js'

// load & mount app
import loadData from './load_data.js'
const config = require('json!../config.json')
const data = loadData(config.map)

import '../components/app.tag'
riot.mount('[data-riot-mount="nrwelmaps__app"]', 'nrwelmaps-app', {config, data})

import './render_comparisons.js'
