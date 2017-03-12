Q = require 'q'
nock = require 'nock'
request = require 'request'
sinon = require 'sinon'

Api = require '../lib/api'


nock('https://api.tictail.com')
    .get('/v1.23/stores/t')
    .replyWithFile(200, __dirname + '/responses/store.json')

nock('https://api.tictail.com')
    .get('/v1.23/stores/0')
    .reply(400, {})


describe 'Api', ->
  it 'should get an endpoint', ->
    api = new Api()
    api.get('stores/t').then((data) ->
      data.constructor.should.eql(Object)
    )

  it 'should reject upon status > 200', ->
    api = new Api()
    api.get('stores/0').fail (err) ->
      err.status.should.eql(400)

  it 'caches data between requests', ->
    sinon.stub(request, 'get').yields(null, [{body: '{}'}])

    api = new Api()

    api.get('stores/t').then(->
      api.get('stores/t').then(->
        request.get.callCount.should.eql 1
        request.get.restore()
      )
    )
