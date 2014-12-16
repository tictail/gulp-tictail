module.exports = (response) ->

  response.then (store) ->
    data =
      store_name: store.name
      store_url: ''
      store_email: 'developers@tictail.com'
      store_description: store.description
      store_blog_url: 'https://medium.com/tictail-makers'
      store_subdomain: 'example'
      store_identifier: store.id
      logotype: {}

    if store.logotype
      for size in store.logotype[0].sizes
        data.logotype['url-'+size] = sizes[size]

    data
