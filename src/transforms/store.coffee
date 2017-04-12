_ = require 'lodash'


module.exports =
  legalLink: (type, store_url) ->
    (value, render) ->
      render """
        <a rel="nofollow" class="tictail_#{type} fullscreen fullscreen_iframe"
          data-fullscreen-group="tictail_#{type}" data-fullscreen-no-repeat
          href="#{store_url}/legal/#{type}">
          #{value}
        </a>
      """

  search: ->
    """
    <form id="tictail_search" class="tictail_form tictail_search">
        <span class="tictail_search_border" style="display:none">
          Search
        </span>
        <input id="tictail_search_box" class="tictail_search_box" name="q" autocomplete="off"
          type="text" title="Search" />
    </form>
    """

  transform: (data) ->
    store =
      logotype: _.map data.logotype, (image) ->
        images = {}
        for size in [100, 1000, 2000, 30, 300, 40, 45, 50, 500, 640, 75]
          images["url-#{size}"] = "#{image.url}?w=#{size}"
        images
      return_policy: -> module.exports.legalLink 'return-policy', data.url
      search: module.exports.search
      store_blog_url: 'https://medium.com/tictail-makers'
      store_description: data.description
      store_email: 'developers@tictail.com'
      store_identifier: data.id
      store_name: data.name
      store_short_description: data.short_description
      store_subdomain: data.subdomain
      store_url: '' # Empty as this is for development
      store_language: data.language
      user_language: 'en'
      terms: -> module.exports.legalLink 'terms', data.url
      wallpaper: _.map [data.wallpapers.iphone], (image) ->
        images = {}
        for size in [640, 1000, 2000]
          images["url-#{size}"] = "#{image.url}?w=#{size}"
        images

    store
