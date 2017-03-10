{transform} = require '../lib/transforms/store'
data = require './responses/store'


describe 'Store transforms', ->
  it 'should transform store', ->
    expected =
      logotype: [
        "url-100": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=100"
        "url-1000": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=1000"
        "url-2000": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=2000"
        "url-30": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=30"
        "url-300": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=300"
        "url-40": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=40"
        "url-45": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=45"
        "url-50": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=50"
        "url-500": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=500"
        "url-640": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=640"
        "url-75": "https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?size=75"
      ]
      store_blog_url: 'https://medium.com/tictail-makers'
      store_description: 'This is a test store and intended for testing purposes only. Ordered products will <b>not </b>be<b>&nbsp;</b>fulfilled.'
      store_email: 'developers@tictail.com'
      store_identifier: 't'
      store_name: 'The Startup Store'
      store_subdomain: 'thestartupstore'
      store_url: ''

    transform(data).should.eql(expected)
