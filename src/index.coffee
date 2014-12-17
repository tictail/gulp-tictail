_ = require 'lodash'
express = require 'express'
util = require 'gulp-util'
storefront = require './storefront'


module.exports =
  serve: (config = {}) ->
    defaults =
      port: 5555
      dist: './dist'

    config = _.assign defaults, config

    app = express()
    app.use express.static config.dist
    app.use storefront
    app.listen config.port, -> util.log "I'm alive!"
