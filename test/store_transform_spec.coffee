{transform, legalLink, search} = require '../lib/transforms/store'
data = require './responses/store'


describe 'Store transforms', ->
  it 'should transform store', ->
    expected =
      logotype: [
        'url-100': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=100'
        'url-1000': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=1000'
        'url-2000': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=2000'
        'url-30': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=30'
        'url-300': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=300'
        'url-40': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=40'
        'url-45': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=45'
        'url-50': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=50'
        'url-500': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=500'
        'url-640': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=640'
        'url-75': 'https://imgix.ttcdn.co/i/logotype/original/0/25-4466cdc4aa034e169e012e7fdadea743.png?w=75'
      ]
      return_policy: -> legalLink 'return-policy', data.url
      search: search
      store_blog_url: 'https://medium.com/tictail-makers'
      store_description: 'This is a test store and intended for testing purposes only. Ordered products will <b>not </b>be<b>&nbsp;</b>fulfilled.'
      store_email: 'developers@tictail.com'
      store_identifier: 't'
      store_name: 'The Startup Store'
      store_short_description: 'Stuff you will never want to have, trust me!'
      store_subdomain: 'thestartupstore'
      store_url: ''
      terms: -> legalLink 'terms', data.url
      wallpaper: [
        'url-1000': 'https://imgix.ttcdn.co/i/wallpaper/original/0/25-68fa9936b87e403d948189716992a11a.jpeg?w=1000'
        'url-2000': 'https://imgix.ttcdn.co/i/wallpaper/original/0/25-68fa9936b87e403d948189716992a11a.jpeg?w=2000'
        'url-640': 'https://imgix.ttcdn.co/i/wallpaper/original/0/25-68fa9936b87e403d948189716992a11a.jpeg?w=640'
      ]

    transformedStore = transform(data)

    [
      'logotype'
      'search'
      'store_blog_url'
      'store_description'
      'store_email'
      'store_identifier'
      'store_name'
      'store_short_description'
      'store_subdomain'
      'store_url'
      'wallpaper'
    ].map (key) ->
      transformedStore[key].should.eql(expected[key])

    # TODO: Test terms & return_policy
