module.exports =
  transform: (data) ->
    store =
      store_name: data.name
      store_url: ''
      store_email: 'developers@tictail.com'
      store_description: data.description
      store_blog_url: 'https://medium.com/tictail-makers'
      store_subdomain: 'example'
      store_identifier: data.id
      logotype: {}

    if data.logotype
      for size, url of data.logotype[0].sizes
        store.logotype["url-#{size}"] = url

    store
