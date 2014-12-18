_ = require 'lodash'
Q = require 'q'
express = require 'express'
consolidate = require 'consolidate'
Api = require './api'
transforms = require './transforms'
merge = require 'merge'
fs = require 'fs'


api = new Api()

app = express()
app.engine 'mustache', consolidate.mustache
app.set 'view engine', 'mustache'
app.disable 'etag'

app.use (req, res, next) ->
  res.promises = []

  store = api.get "stores/#{app.get 'store_id'}"

  res.promises.push(store.then (data) -> transforms.store.transform(data))
  res.promises.push(
    Q.spread([
      store,
      api.get("stores/#{app.get 'store_id'}/categories"),
    ], (store, categories) ->
      transforms.navigation.transform(store, categories)
    )
  )

  next()

app.get '/', (req, res, next) ->
  res.promises.push(
    api.get("stores/#{app.get 'store_id'}/products")
      .then (data) -> list_page: products: transforms.products.transform(data)
  )

  res.promises.push(
    Q.resolve(
      list_page:
        on_index: true
        no_current_navigation: true
    )
  )

  next()

app.get '/products', (req, res, next) ->
  # TODO Move this duplication somewhere
  res.promises.push(
    api.get("stores/#{app.get 'store_id'}/products").then (data) ->
      list_page: products: transforms.products.transform(data)
  )

  next()

app.get '/products/:slug/:slug?', (req, res, next) ->
  slug = req.params.slug

  res.promises.push(
    api.get("stores/#{app.get 'store_id'}/products").then (data) ->
      list_page: products: transforms.products.transform(data, slug)
  )

  next()

app.get '/product/:slug', (req, res, next) ->
  slug = req.params.slug

  res.promises.push(
    api.get("stores/#{app.get 'store_id'}/products").then (data) ->
      datum = _.find(data, (datum) -> datum.slug == slug)
      product_page: product: transforms.product.transform(datum)
  )

  next()

app.get '/:guid', (req, res, next) ->
  data = {}
  data["#{req.params.guid}_page"] = true

  res.promises.push(Q.resolve(data))

  next()

app.use (req, res) ->
  data =
    partials: {}
  _.each fs.readdirSync(app.get 'views'), (path) ->
    match = (/(.*)\.mustache/g).exec path
    if !match or (match && match[1] is 'theme')
      return
    partial = match[1]
    data.partials[partial] = partial

  Q.all res.promises
    .then (results) ->
      for result in results
        data = merge.recursive(data, result)

      for category in data.navigation
        if req.path is category.url
          category.is_current = true
          data.list_page.current_navigation = category
          break
        for subcategory in category.children
          if req.path is subcategory.url
            category.is_current = true
            subcategory.is_current = true
            data.list_page.current_navigation = subcategory
            break

      res.render 'theme', data
    .catch (reason) ->
      console.log reason, reason.stack
      res.status(500)


module.exports = app
