transforms = require '../transforms'


module.exports = (req, res, next) ->
  api = req.app.get 'api'

  res.promises.push(
    api.get "stores/#{req.app.get 'store_id'}"
      .then (data) -> transforms.store.transform(data)
  )

  next()
