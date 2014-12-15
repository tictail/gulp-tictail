request = require 'supertest'
express = require 'express'

storefront = require '../lib/storefront'


storefront.set('views', __dirname)

describe 'Storefront', ->
it 'should get /', (done) ->
  request(storefront)
    .get('/')
    .expect(200, done)
