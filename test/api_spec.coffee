Q = require 'q'
nock = require 'nock'
request = require 'request'
sinon = require 'sinon'

Api = require '../lib/api'


nock('https://api.tictail.com')
    .get('/v1.10/stores/px8')
    .replyWithFile(200, __dirname + '/responses/store.json')

nock('https://api.tictail.com')
    .get('/v1.10/stores/0')
    .reply(400, {})


describe 'Api', ->
  it 'should get an endpoint', ->
    api = new Api()
    api.get("stores/px8").then((data) ->
      data.constructor.should.eql(Object)
    )

  it 'should reject upon status > 200', ->
    api = new Api()
    api.get("stores/0").fail (err) ->
      err.status.should.eql(400)

  it 'caches data between requests', ->
    sinon.stub(request, 'get').yields(null, [{body: '{}'}])

    api = new Api()

    api.get("stores/px8").then(->
      api.get("stores/px8").then(->
        request.get.callCount.should.eql 1
        request.get.restore()
      )
    )
