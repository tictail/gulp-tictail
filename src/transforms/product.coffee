_ = require 'lodash'

{priceToMajor} = require '../util'
{facebookLikeButton, twitterTweetButton} = require './store'


module.exports =
  addToCartForm: ->
    (label, render) ->
      """<form class="tictail_add_to_cart">#{render(label)}</form>"""

  variationsRadio: ->
    (label, render) ->
      render """{{#variations}}
          {{#in_stock}}
            <input type="radio" name="variation_id"
              {{#is_default}}checked{{/is_default}}
              value="{{id}}" id="variation_id_{{id}}"
              class="tictail_radio tictail_variation_radio">
            <label for="variation_id_{{id}}"
              class="tictail_label tictail_variation_label">
              {{label}}
            </label>
          {{/in_stock}}
        {{/variations}}"""

  variationsSelect: ->
    (label, render) ->
      render """<select name="variation_id"
          class="tictail_select tictail_variations_select">
          {{#variations}}
            {{#in_stock}}
              <option value="{{id}}">{{label}}</option>
            {{/in_stock}}
          {{/variations}}
        </select>"""

  addToCartButton: ->
    (label, render) ->
      """<button type="submit" class="tictail_button tictail_add_to_cart_button">
          #{render(label)}
        </button>"""

  slideshow: (size) ->
    ->
      (label, render) ->
        render """<div class="tictail_slideshow loop">
            {{#all_images}}
              <div class="slide image_slide">
                <a href="{{url-2000}}" class="fullscreen fullscreen_image"
                  data-fullscreen-group="product-{{id}}-images">
                  {{#is_primary}}
                    <img src="{{url-#{size}}}" alt="{{title}}" itemprop="image"/>
                  {{/is_primary}}
                  {{^is_primary}}
                    <div class="image_placeholder" data-src="{{url-#{size}}}"></div>
                  {{/is_primary}}
                </a>
              </div>
            {{/all_images}}
          </div>"""

  pinterestPinItButton: ->
    ->

  transform: (data) ->
    price = priceToMajor data.price, data.currency
    product =
      title: data.title
      description: data.description
      url: "/product/#{data.slug}"
      absolute_url: "/product/#{data.slug}"
      identifier: data.id,
      price: "#{price.toFixed(2)} #{data.currency}"
      price_without_currency: price,
      price_with_currency: "#{price} #{data.currency}"
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

    if product.variations.length > 1
      product.variations_radio = module.exports.variationsRadio
      product.variations_select = module.exports.variationsSelect

    if product.all_images
      product.primary_image = product.all_images[0]
      for size of data.images[0].sizes
        product["slideshow-#{size}"] = module.exports.slideshow(size)

    if not product.out_of_stock
      product.add_to_cart = module.exports.addToCartForm
      product.add_to_cart_button = module.exports.addToCartButton

    product.facebook_like_button = facebookLikeButton product.absolute_url

    product.twitter_tweet_button = twitterTweetButton product.absolute_url,
      "Worth checking out! #{product.title} sold by #{data.store_name} via @tictail"

    product
