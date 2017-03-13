request = require 'supertest'
nock = require 'nock'
express = require 'express'

storefront = require '../lib/storefront'
storefront.set 'store_id', 't'


views = storefront.get 'views'
views.push __dirname
storefront.set 'views', views


nock('https://api.tictail.com')
    .get('/v1.23/stores/t')
    .replyWithFile(200, __dirname + '/responses/store.json')

nock('https://api.tictail.com')
    .get('/v1.23/stores/t/products?order_by=position')
    .replyWithFile(200, __dirname + '/responses/products.json')

nock('https://api.tictail.com')
    .get('/v1.23/stores/t/categories')
    .replyWithFile(200, __dirname + '/responses/categories.json')


describe 'Storefront', ->
  it 'should get /', (done) ->
    request(storefront)
      .get('/')
      .expect(200, done)

  it 'should get /products', (done) ->
    request(storefront)
      .get('/products')
      .expect(200, done)

  it 'should get /products/aaa', (done) ->
    request(storefront)
      .get('/products/aaa')
      .expect(200, done)

  it 'should get /products/aaa/bbb', (done) ->
    request(storefront)
      .get('/products/aaa/bbb')
      .expect(200, done)

  it 'should get /product/3-izettle-logo-stickers-478', (done) ->
    request(storefront)
      .get('/product/3-izettle-logo-stickers-478')
      .expect(200, done)

  it 'should not find /product/aaa123', (done) ->
    request(storefront)
      .get('/product/aaa123')
      .expect(404, done)

  it 'should get /about', (done) ->
    request(storefront)
      .get('/about')
      .expect(200, done)
