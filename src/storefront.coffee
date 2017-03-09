express = require 'express'
consolidate = require 'consolidate'

Api = require './api'

app = express()
app.engine 'mustache', consolidate.mustache
app.set 'view engine', 'mustache'
app.set 'views', [__dirname + '/views']
app.set 'api', new Api()
app.disable 'etag'

{boot, misc, partials, store, search, navigation, start, products, product, page, render} = require './middlewares'

app.use boot, partials, misc, store, navigation
app.get '/', start, products
app.get '/products', products
app.get '/products/:slug/:slug?', products
app.get '/product/:slug', product
app.get '/:guid', page
app.get '/search', search
app.use render

module.exports = app
