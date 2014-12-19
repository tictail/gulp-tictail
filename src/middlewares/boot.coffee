module.exports = (req, res, next) ->
  res.promises = []
  next()
