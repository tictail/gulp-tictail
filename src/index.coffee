_ = require 'lodash'
express = require 'express'
util = require 'gulp-util'

storefront = require './storefront'
fs = require 'fs'


module.exports =
  serve: (config = {}) ->
    defaults =
      port: 5555
      dist: './dist'
      src: './src'
      store_id: 't'

    config = _.assign defaults, config

    app = express()
    app.use express.static config.dist
    storefront.set 'store_id', config.store_id
    views = storefront.get 'views'
    views.push config.src
    storefront.set 'views', views
    app.use storefront
    app.listen config.port, -> util.log "Serving your awesome theme at http://localhost:#{config.port}/"

  build: (config = {}) ->
    defaults =
      dist: './dist'
      src: './src'

    config = _.assign defaults, config

    util.log "Building theme from #{config.src}"

    files = []
    _.each fs.readdirSync(config.src), (path) ->
      match = (/(.*)\.mustache/g).exec path
      if !match
        return
      files.push match[1]

    if 'theme' not in files
      return util.log "Could not find 'theme.mustache' in #{config.src}"

    partials = _.filter files, (file) -> file isnt 'theme'
    theme = fs.readFileSync "#{config.src}/theme.mustache"
      .toString()

    for partial in partials
      # TODO: Also match {{> foobar}}
      theme = theme.replace(
        new RegExp("{{>\s?#{partial}}}", 'g')
        fs.readFileSync("#{config.src}/#{partial}.mustache").toString()
      )

    fs.mkdirSync(config.dist) unless fs.existsSync(config.dist)

    fileName = config.fileName or 'theme'
    fs.writeFileSync "#{config.dist}/#{fileName}.html", theme

    util.log "Theme written to #{config.dist}/theme.html"

    # TODO: Possible to return stream?
