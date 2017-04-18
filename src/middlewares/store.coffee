transforms = require '../transforms'


module.exports = (req, res, next) ->
  api = req.app.get 'api'

  res.promises.push(
    api.get "stores/#{req.app.get 'store_id'}"
      .then (data) ->
        transforms.store.transform data
  )
  res.promises.push(
    api.get "stores/#{req.app.get 'store_id'}/instagram/media/recent"
      .then (data) ->
        transforms.social.transform data
  )

  next()
