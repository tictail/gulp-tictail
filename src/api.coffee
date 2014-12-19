Q = require 'q'
request = require 'request'
HTTPError = require 'node-http-error'


module.exports = class Api
  base: "https://api.tictail.com/v1"

  constructor: ->
    @promises = {}

  get: (endpoint) =>
    if not @promises[endpoint]
      @promises[endpoint] = Q.nfcall(request.get, "#{@base}/#{endpoint}")
        .then (data) ->
          response = data[0]

          if response.statusCode > 200
            throw HTTPError(response.statusCode, response.body)

          JSON.parse response.body
    else
      @promises[endpoint]
