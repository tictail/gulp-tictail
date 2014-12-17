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

id = 'px8' # TODO: Use config


app.use (req, res, next) ->
  res.promises = []
  store = api.get "stores/#{id}"
  res.promises.push transforms.store store
  res.promises.push transforms.navigation(
    store
    api.get("stores/#{id}/categories")
  )
  next()

app.get '/', (req, res, next) ->
  res.promises.push transforms.products api.get "stores/#{id}/products"
  res.data =
    list_page:
      on_index: true
      no_current_navigation: true
  next()

app.get '/products', (req, res, next) ->
  res.promises.push transforms.products api.get "stores/#{id}/products"
  next()

app.get '/products/:slug/:slug?', (req, res, next) ->
  res.promises.push transforms.products(
    api.get "stores/#{id}/products"
    req.params.slug
  )
  next()

app.get '/product/:slug', (req, res, next) -> next()
app.get '*', (req, res, next) -> next()

app.use (req, res) ->
  # TODO Load partials

  Q.all res.promises
    .then (results) ->
      data = {}
      for result in results
        data = merge.recursive(data, result)
      if res.data
        data = merge.recursive(data, res.data)
      res.render 'theme', data
    .catch (reason) ->
      console.log reason, reason.stack
      res.status(500)


module.exports = app
