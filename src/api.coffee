Q = require 'q'
request = require 'request'

module.exports = class Api
  base: "https://api.tictail.com/v1"

  constructor: ->
    @cache = {}

  get: (endpoint) =>
    if @cache[endpoint]?
      Q.resolve(@cache[endpoint])
    else Q.nfcall(request.get, "#{@base}/#{endpoint}").then (data) =>
      @cache[endpoint] = JSON.parse data[0].body
