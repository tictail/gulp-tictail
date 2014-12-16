_ = require 'lodash'

module.exports = (response) ->

  price_to_major = (amount, currency) ->
    digits = currency.toLowerCase() == 'jpy' ? 0 : 2
    amount / Math.pow 10, digits

  response.then (products) ->
    data = _.map products, (product) ->
      price = price_to_major product.price, product.currency
      {
        title: product.title
        description: product.description
        url: "product/#{product.slug}"
        absolute_url: "/product/#{product.slug}"
        identifier: product.id,
        price: "#{price.toFixed(2)} #{product.currency}"
        price_without_currency: price,
        price_with_currency: "#{price} #{product.currency}"
        currency_code: product.currency
        quantity_sum: product.quantity
        is_quantity_unlimited: product.unlimited
        in_stock: product.quantity || product.unlimited
        out_of_stock: !product.quantity && !product.unlimited
      }

    {
      list_page:
        products: data
    }
