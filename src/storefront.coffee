_ = require 'lodash'
Q = require 'q'
express = require 'express'
consolidate = require 'consolidate'
Api = require './api'
transforms = require './transforms'
merge = require 'merge'


api = new Api()

app = express()
app.engine 'mustache', consolidate.mustache
app.set 'view engine', 'mustache'
app.set 'views', './src'
app.disable 'etag'


app.use (req, res, next) ->
  res.promises = []
  store = api.get "stores/#{app.get 'store_id'}"
  res.promises.push transforms.store store
  res.promises.push transforms.navigation(
    store
    api.get("stores/#{app.get 'store_id'}/categories")
  )
  next()

app.get '/', (req, res, next) ->
  res.promises.push transforms.products api.get "stores/#{app.get 'store_id'}/products"
  res.data =
    list_page:
      on_index: true
      no_current_navigation: true
  next()

app.get '/products', (req, res, next) ->
  res.promises.push transforms.products api.get "stores/#{app.get 'store_id'}/products"
  next()

app.get '/products/:slug/:slug?', (req, res, next) ->
  res.promises.push transforms.products(
    api.get "stores/#{app.get 'store_id'}/products"
    req.params.slug
  )
  next()

app.get '/product/:slug', (req, res, next) -> next()

app.get '/:guid', (req, res, next) ->
  res.data = {}
  res.data["#{req.params.guid}_page"] = true
  next()

app.use (req, res) ->
  # TODO Load partials

  Q.all res.promises
    .then (results) ->
      data = {}
      for result in results
        data = merge.recursive(data, result)
      if res.data
        data = merge.recursive(data, res.data)
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
