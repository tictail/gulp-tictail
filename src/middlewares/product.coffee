Q = require 'q'
_ = require 'lodash'

HTTPError = require 'node-http-error'
transforms = require '../transforms'


module.exports = (req, res, next) ->
  slug = req.params.slug
  api = req.app.get 'api'
  storeId = req.app.get 'store_id'

  res.promises.push(
    api.get "stores/#{storeId}/products?order_by=position"
      .then (data) ->
        datum = _.find(data, (datum) -> datum.slug is slug)

        if not datum
          throw new HTTPError(404, "Product not found.")

        product_page:
          product:
            transforms.product.transform datum
          related_products:
            _.map(_.sampleSize(data, 3), transforms.product.transform)
  )

  next()
