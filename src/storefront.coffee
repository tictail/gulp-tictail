express = require 'express'
consolidate = require 'consolidate'

Api = require './api'

app = express()
app.engine 'mustache', consolidate.mustache
app.set 'view engine', 'mustache'
app.set 'views', [__dirname + '/views']
app.set 'api', new Api()
app.disable 'etag'

{boot, partials, store, navigation, root, products, product, page, render} = require './middlewares'

app.use boot, partials, store, navigation
app.get '/', root, products
app.get '/products', products
app.get '/products/:slug/:slug?', products
app.get '/product/:slug', product
app.get '/:guid', page
app.use render

module.exports = app
