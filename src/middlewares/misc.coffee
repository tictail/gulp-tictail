Q = require 'q'

module.exports = (req, res, next) ->
  res.promises.push(
    Q.resolve(
      lang: ->
        (value, render) ->
          render(value)
    )
  )

  next()
