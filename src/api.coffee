Q = require 'q'
request = require 'request'

module.exports = class Api
  base: "https://api.tictail.com/v1"

  constructor: ->
    @promises = {}

  get: (endpoint) =>
    if not @promises[endpoint]
      @promises[endpoint] = Q.nfcall(request.get, "#{@base}/#{endpoint}").then (data) =>
        JSON.parse data[0].body
    else
      @promises[endpoint]
