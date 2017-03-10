_ = require 'lodash'
merge = require 'merge'


module.exports =
  transform: (store, categories) ->
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

    navigation =
      navigation: _.values navigation

    navigation
