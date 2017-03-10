request = require 'request'

module.exports = (req, res, next) ->
  api = req.app.get 'api'

  api.get "stores/#{req.app.get 'store_id'}"
    .then (data) ->
      response = request.get "#{data.url}/search?q=#{req.query.q}",
        (error, response, body) ->
          res.json JSON.parse body
