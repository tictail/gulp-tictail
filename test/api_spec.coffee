Q = require 'q'
request = require 'request'
sinon = require 'sinon'

Api = require '../lib/api'


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
