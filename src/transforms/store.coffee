module.exports =
  searchForm: ->
    (label, render) ->
      "<form id=\"tictail_search\" class=\"tictail_form tictail_search\">
        <input id=\"tictail_search_box\"
          class=\"tictail_search_box\"
          name=\"q\"
          autocomplete=\"off\"
          type=\"text\"
          title=\"Search\" />
      </form>"

  transform: (data) ->
    store =
      store_name: data.name
      store_url: ''
      store_email: 'developers@tictail.com'
      store_description: data.description
      store_blog_url: 'https://medium.com/tictail-makers'
      store_subdomain: data.subdomain
      store_identifier: data.id
      logotype: {}

    if data.logotype
      for size, url of data.logotype[0].sizes
        store.logotype["url-#{size}"] = url

    store.search = module.exports.searchForm

    store
