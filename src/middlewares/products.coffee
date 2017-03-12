Q = require 'q'

transforms = require '../transforms'


module.exports = (req, res, next) ->
  api = req.app.get 'api'
  storeId = req.app.get 'store_id'
  slug = req.params.slug

  res.promises.push(
    api.get "stores/#{storeId}/products?order_by=position"
      .then (data) ->
        list_page:
          products: transforms.products.transform data, slug
  )

  next()
