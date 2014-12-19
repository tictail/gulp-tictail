request = require 'supertest'
express = require 'express'

storefront = require '../lib/storefront'
storefront.set 'store_id', 't'


storefront.set('views', __dirname)

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

  it 'should get /product/wrapp-logo-startup-stickers', (done) ->
    request(storefront)
      .get('/product/wrapp-logo-startup-stickers')
      .expect(200, done)

  it 'should not find /product/aaa', (done) ->
    request(storefront)
      .get('/product/aaa')
      .expect(404, done)

  it 'should get /about', (done) ->
    request(storefront)
      .get('/about')
      .expect(200, done)
