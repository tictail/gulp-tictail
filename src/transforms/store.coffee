_ = require 'lodash'


module.exports =
  transform: (data) ->
    store =
      store_name: data.name
      store_url: '' # Empty as this is for development
      store_email: 'developers@tictail.com'
      store_description: data.description
      store_blog_url: 'https://medium.com/tictail-makers'
      store_subdomain: data.subdomain
      store_identifier: data.id
      logotype: _.map data.logotype, (image) ->
        images = {}
        for size in [100, 1000, 2000, 30, 300, 40, 45, 50, 500, 640, 75]
          images["url-#{size}"] = "#{image.url}?size=#{size}"
        images

    store
