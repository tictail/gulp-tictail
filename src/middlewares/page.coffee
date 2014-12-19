Q = require 'q'


module.exports = (req, res, next) ->
  data = {}
  data["#{req.params.guid}_page"] = true

  res.promises.push(Q.resolve(data))

  next()
