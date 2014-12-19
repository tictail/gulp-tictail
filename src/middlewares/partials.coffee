fs = require 'fs'

Q = require 'q'
_ = require 'lodash'


module.exports = (req, res, next) ->
  data =
    partials: {}

  _.each fs.readdirSync(req.app.get 'views'), (path) ->
    match = (/(.*)\.mustache/g).exec path
    if !match or (match && match[1] is 'theme')
      return
    partial = match[1]
    data.partials[partial] = partial

  res.promises.push(Q.resolve(data))

  next()
