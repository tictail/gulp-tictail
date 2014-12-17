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
