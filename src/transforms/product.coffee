_ = require 'lodash'

{priceToMajor} = require '../util'


formatPrice = (price, currency) ->
  "#{priceToMajor(price, currency).toFixed(2)} <span class=\"currency currency_#{currency.toUpperCase()}\">#{currency}</span>"

priceTag = (price, originalPrice, saleActive, currency) ->
  ->
    return formatPrice(price, currency) unless saleActive
    """<span class="price_tag"><span class="original_price"
      style="text-decoration: line-through">#{formatPrice(originalPrice, currency)}</span> <span
      class="sale_price">#{formatPrice(price, currency)}</span></span>"""

imagePosition = (images, variation) ->
  return null if variation.image_ids.length == 0
  imagePositionMap = {}
  for image, index in images
    imagePositionMap[image.id] = index
  return imagePositionMap[variation.image_ids[0]]

videoHlsStream = (image) ->
  return null if image.type != 'video' or !image.data?.streams
  stream = image.data.streams.find (s) -> s.quality == "hls"
  return null if not stream
  return {
    src: stream.url
    type: "application/x-mpegURL"
  }

videoSizeStream = (image, size) ->
  return null if image.type != 'video' or !image.data?.streams
  streams = image.data.streams.filter (s) -> s.quality != "hls"
  streams = streams.sort (a, b) -> Math.abs(a.width - size) - Math.abs(b.width - size)
  return null if streams.length == 0
  stream = streams[0]
  return {
    src: stream.url
    type: stream.type
  }


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

  variationsSelect: (variations) ->
    return if variations.length <= 1
    prices = []
    for variation in variations
      price = "#{variation.original_price}#{variation.sale_active}#{variation.sale_price}"
      prices.push price if prices.indexOf(price) == -1
    has_variation_prices = prices.length > 1
    ->
      (value, render) ->
        render """
          <select name="variation_id" class="tictail_select tictail_variations_select">
            {{#variations}}
              <option
                data-price="{{price_without_currency}}"
                data-currency-code="{{currency_code}}"
                data-sale-active="{{sale_active}}"
                data-original-price="{{original_price_without_currency}}"
                data-image-position="{{image_position}}"
                value="{{id}}"{{#out_of_stock}} disabled{{/out_of_stock}}>
                #{if has_variation_prices then "{{label}} ({{price_without_currency}} {{currency_code}})" else "{{label}}"}
              </option>
            {{/variations}}
          </select>
        """

  transform: (data) ->
    product =
      title: data.title
      description: data.description
      url: "product/#{data.slug}"
      absolute_url: "/product/#{data.slug}"
      identifier: data.id,
      price: formatPrice data.price, data.currency
      price_without_currency: priceToMajor data.price, data.currency
      price_tag: priceTag data.price, data.original_price, data.sale_active, data.currency
      price_with_currency: priceTag data.price, data.original_price, data.sale_active, data.currency
      sale_active: data.sale_active
      currency_code: data.currency
      quantity_sum: data.quantity
      is_quantity_unlimited: data.unlimited
      in_stock: data.quantity || data.unlimited
      out_of_stock: !data.quantity && !data.unlimited
      all_images: _.map data.images, (image, index) ->
        imageData =
          is_primary: index == 0
          position: index
        for size in [100, 1000, 2000, 30, 300, 40, 45, 50, 500, 640, 75]
          imageData["url-#{size}"] = "#{image.url}?w=#{size}"

        if image.type == "video"
          imageData.video = {}
          hlsStream = videoHlsStream(image)
          for size in [100, 200, 500, 1000, 2000]
            sizeStream = videoSizeStream(image, size)
            streams = []
            streams.push(hlsStream) if hlsStream
            streams.push(sizeStream) if sizeStream
            imageData.video["streams-#{size}"] = streams
        else
          imageData.video = null

        imageData
      variations: _.map data.variations, (variation, index) ->
        return false if not variation.title
        label: variation.title
        position: index
        identifier: variation.id
        quantity: variation.quantity
        is_default: index == 0
        in_stock: variation.quantity || variation.unlimited
        out_of_stock: !variation.quantity && !variation.unlimited
        price: formatPrice variation.price, data.currency
        price_without_currency: priceToMajor variation.price, data.currency
        price_tag: priceTag variation.price, variation.original_price, variation.sale_active, data.currency
        price_with_currency: priceTag variation.price, variation.original_price, variation.sale_active, data.currency
        sale_active: variation.sale_active
        image_position: imagePosition data.images, variation
      variations_select: module.exports.variationsSelect data.variations
      save_button: module.exports.saveButton

    if product.variations.length is 1
      product.variations = []

    if product.all_images
      product.primary_image = product.all_images[0]

    if not product.out_of_stock
      product.add_to_cart = module.exports.addToCartForm
      product.add_to_cart_button = module.exports.addToCartButton

    product
