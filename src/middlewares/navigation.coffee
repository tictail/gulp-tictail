Q = require 'q'

transforms = require '../transforms'


module.exports = (req, res, next) ->
  api = req.app.get 'api'
  storeId = req.app.get 'store_id'

  res.promises.push(
    Q.spread([
      api.get "stores/#{storeId}"
      api.get "stores/#{storeId}/categories"
    ], (store, categories) ->
      transforms.navigation.transform store, categories
    )
  )

  next()
