Q = require 'q'


module.exports =
  shouldTransform: (transform, data, expected) ->
    transform Q.resolve(data)
      .then (transformed) ->
        transformed.should.eql expected
