_    = require 'lodash'
slug = require 'slug'
Q    = require 'q'

module.exports = (store, categories) ->

	Q.spread [store, categories], (store, categories) ->
    data =
      navigation: _.map categories, (category) ->
        label: category.title,
        product_count: category.product_count,
        url: "/products/#{slug(category.title)}"

    data.terms = ->
      (label) ->
        "<a class=\"tictail_terms fullscreen fullscreen_iframe\" href=\"#{store.url}/legal/terms\">#{label}</a>"

    data.return_policy = ->
      (label) ->
        "<a class=\"tictail_return-policy fullscreen fullscreen_iframe\" href=\"#{store.url}/legal/return-policy\">#{label}</a>"

    data