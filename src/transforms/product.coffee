_ = require 'lodash'

{priceToMajor} = require '../util'


module.exports =
  addToCartForm: ->
    (label, render) ->
      "<form class=\"tictail_add_to_cart\">#{render(label)}</form>"

  addToCartButton: ->
    (label, render) ->
      "<button type=\"submit\" class=\"tictail_button tictail_add_to_cart_button\">#{render(label)}</button>"

  formatPrice: (price, currency) ->
    "#{price.toFixed(2)} <span class=\"currency currency_#{currency.toLowerCase()}\">#{currency}</span>"

  priceTag: (price, originalPrice, saleActive) ->
    ->
      return price unless saleActive
      """<span class="price_tag"><span class="original_price"
        style="text-decoration: line-through">#{originalPrice}</span> <span
        class="sale_price">#{price}</span></span>"""

  transform: (data) ->
    price = priceToMajor data.price, data.currency
    priceFormatted = module.exports.formatPrice price, data.currency
    originalPrice = priceToMajor data.original_price, data.currency
    originalPriceFormatted = module.exports.formatPrice originalPrice, data.currency
    priceTag = module.exports.priceTag priceFormatted, originalPriceFormatted, data.sale_active
    product =
      title: data.title
      description: data.description
      url: "product/#{data.slug}"
      absolute_url: "/product/#{data.slug}"
      identifier: data.id,
      price: priceFormatted
      price_without_currency: price
      price_tag: priceTag
      price_with_currency: priceTag
      sale_active: data.sale_active
      currency_code: data.currency
      quantity_sum: data.quantity
      is_quantity_unlimited: data.unlimited
      in_stock: data.quantity || data.unlimited
      out_of_stock: !data.quantity && !data.unlimited
      all_images: _.map data.images, (image) ->
        images = {}
        for size, url of image.sizes
          images["url-#{size}"] = url
        images
      variations: _.map data.variations, (variation) ->
        return false if not variation.title
        label: variation.title
        position: 0
        identifier: variation.id
        quantity: variation.quantity
        is_default: false
        in_stock: variation.quantity || variation.unlimited
        out_of_stock: !variation.quantity && !variation.unlimited

    if product.variations.length is 1
      product.variations = []

    if product.all_images
      product.primary_image = product.all_images[0]

    if not product.out_of_stock
      product.add_to_cart = module.exports.addToCartForm
      product.add_to_cart_button = module.exports.addToCartButton

    product
