{transform} = require '../lib/transforms/store'
data = require './responses/store'


describe 'Store transforms', ->
  it 'should transform store', ->
    expected =
      logotype: [
        'url-100': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=100'
        'url-1000': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=1000'
        'url-2000': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=2000'
        'url-30': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=30'
        'url-300': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=300'
        'url-40': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=40'
        'url-45': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=45'
        'url-50': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=50'
        'url-500': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=500'
        'url-640': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=640'
        'url-75': 'https://images.ttcdn.co/media/i/logotype/67486-5ada0157d6fc422685fb2a58b9adc4b9.jpeg?size=75'
      ]
      store_blog_url: 'https://medium.com/tictail-makers'
      store_description: 'Testar bara.&nbsp;'
      store_email: 'developers@tictail.com'
      store_identifier: 'px8'
      store_name: 'VW Store'
      store_subdomain: 'blackgoldenretriever'
      store_url: ''

    transform(data).should.eql(expected)
