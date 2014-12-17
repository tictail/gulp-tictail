_ = require 'lodash'
Q = require 'q'
merge = require 'merge'

module.exports = (store, categories) ->

  Q.spread [store, categories], (store, categories) ->
    navigation = {}
    for category in categories
      item =
        label: category.title
        product_count: category.product_count
        url: "/products/#{category.slug}"
        count: category.product_count
        children: []
        is_current: false
      if category.parent_id
        item.url = "#{navigation[category.parent_id].url}/#{category.slug}"
        if not navigation[category.parent_id]
          navigation[category.parent_id] =
            children: []
        navigation[category.parent_id].children.push item
      else
        if navigation[category.id]
          navigation[category.id] = merge.recursive(navigation[category.id], item)
        else
          navigation[category.id] = item

    data =
      navigation: _.values navigation

    data.terms = ->
      (label) ->
        "<a class=\"tictail_terms fullscreen fullscreen_iframe\" href=\"#{store.url}/legal/terms\">#{label}</a>"

    data.return_policy = ->
      (label) ->
        "<a class=\"tictail_return-policy fullscreen fullscreen_iframe\" href=\"#{store.url}/legal/return-policy\">#{label}</a>"

    data
