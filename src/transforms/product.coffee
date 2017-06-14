_ = require 'lodash'

{priceToMajor} = require '../util'


module.exports =
  addToCartForm: ->
    (value, render) ->
      "<form class=\"tictail_add_to_cart\">#{render(value)}</form>"

  addToCartButton: ->
    (value, render) ->
      "<button type=\"submit\" class=\"tictail_button tictail_add_to_cart_button\">#{render(value)}</button>"
  
  saveButton: ->
    (value, render) ->
      "<button class=\"tictail_button tictail_save_button\" data-productId={{identifier}}>#{render(value)}</button>"

  formatPrice: (price, currency) ->
    "#{price.toFixed(2)} <span class=\"currency currency_#{currency.toLowerCase()}\">#{currency}</span>"

  priceTag: (price, originalPrice, saleActive) ->
    ->
      return price unless saleActive
      """<span class="price_tag"><span class="original_price"
        style="text-decoration: line-through">#{originalPrice}</span> <span
        class="sale_price">#{price}</span></span>"""

  variationsSelect: (numVariations) ->
    return if numVariations <= 1
    ->
      (_, render) ->
        render """
          <select name="variation_id" class="tictail_select tictail_variations_select">
            {{#variations}}
              {{#in_stock}}
                <option value="{{id}}">{{label}}</option>
              {{/in_stock}}
            {{/variations}}
          </select>
        """

  transform: (data) ->
    price = priceToMajor data.price, data.currency
    priceFormatted = module.exports.formatPrice price, data.currency
    originalPrice = priceToMajor data.original_price, data.currency
    originalPriceFormatted = module.exports.formatPrice originalPrice, data.currency
    priceTag = module.exports.priceTag priceFormatted, originalPriceFormatted, data.sale_active
    variationsSelect = module.exports.variationsSelect data.variations.length
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
        for size in [100, 1000, 2000, 30, 300, 40, 45, 50, 500, 640, 75]
          images["url-#{size}"] = "#{image.url}?w=#{size}"
        images
      variations: _.map data.variations, (variation, index) ->
        return false if not variation.title
        label: variation.title
        position: index
        identifier: variation.id
        quantity: variation.quantity
        is_default: index == 0
        in_stock: variation.quantity || variation.unlimited
        out_of_stock: !variation.quantity && !variation.unlimited
      variations_select: variationsSelect
      save_button: module.exports.saveButton

    if product.variations.length is 1
      product.variations = []

    if product.all_images
      product.primary_image = product.all_images[0]

    if not product.out_of_stock
      product.add_to_cart = module.exports.addToCartForm
      product.add_to_cart_button = module.exports.addToCartButton

    product
