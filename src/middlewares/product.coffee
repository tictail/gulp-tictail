Q = require 'q'
_ = require 'lodash'

transforms = require '../transforms'


module.exports = (req, res, next) ->
  slug = req.params.slug
  api = req.app.get 'api'
  storeId = req.app.get 'store_id'

  res.promises.push(
    api.get "stores/#{storeId}/products"
      .then (data) ->
        datum = _.find(data, (datum) -> datum.slug is slug)

        product_page:
          product:
            transforms.product.transform datum
  )

  next()
