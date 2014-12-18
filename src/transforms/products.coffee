_ = require 'lodash'

{priceToMajor} = require '../util'
{transform} = require './product'


inCategory = (slug, product) ->
  return true if slug == ''

  slug in (category.slug for category in product.categories)

module.exports =
  transform: (data, slug = '') ->
    filteredData = _.filter(data, _.curry(inCategory)(slug))
    _.map(filteredData, transform)
