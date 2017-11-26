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

  currency_converter: ->
    """
      <div class="tictail_currency_converter">
        <select>
          <option data-decimals="2" value="EUR" selected="">Shop currency: EUR</option>
          <option data-decimals="2" value="AUD">AUD</option>
          <option data-decimals="2" value="CAD">CAD</option>
          <option data-decimals="2" value="CHF">CHF</option>
          <option data-decimals="2" value="CZK">CZK</option>
          <option data-decimals="2" value="DKK">DKK</option>
          <option data-decimals="2" value="EUR">EUR</option>
          <option data-decimals="2" value="GBP">GBP</option>
          <option data-decimals="2" value="HKD">HKD</option>
          <option data-decimals="2" value="HUF">HUF</option>
          <option data-decimals="2" value="ILS">ILS</option>
          <option data-decimals="0" value="JPY">JPY</option>
          <option data-decimals="2" value="MXN">MXN</option>
          <option data-decimals="2" value="NOK">NOK</option>
          <option data-decimals="2" value="NZD">NZD</option>
          <option data-decimals="2" value="PHP">PHP</option>
          <option data-decimals="2" value="PLN">PLN</option>
          <option data-decimals="2" value="RUB">RUB</option>
          <option data-decimals="2" value="SEK">SEK</option>
          <option data-decimals="2" value="SGD">SGD</option>
          <option data-decimals="2" value="THB">THB</option>
          <option data-decimals="2" value="TRY">TRY</option>
          <option data-decimals="2" value="TWD">TWD</option>
          <option data-decimals="2" value="USD">USD</option>
        </select>
      </div>
    """

  reviews: ->
    """
      <div class="tictail_reviews"></div>
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
      store_url: '/'
      store_language: data.language
      user_language: 'en'
      terms: -> module.exports.legalLink 'terms', data.url
      wallpaper: _.map [data.wallpapers.iphone], (image) ->
        images = {}
        for size in [640, 1000, 2000]
          images["url-#{size}"] = "#{image.url}?w=#{size}"
        images

      currency_converter: module.exports.currency_converter
      reviews: module.exports.reviews

    store
