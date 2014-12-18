_ = require 'lodash'


inCategory = (product) ->
  for category in product.categories
    if categorySlug is category.slug
      return true
    else
      continue
  false

priceToMajor = (amount, currency) ->
  digits = currency.toLowerCase() == 'jpy' ? 0 : 2
  amount / Math.pow 10, digits

addToCartButton = (label) ->
  "<button type=\"submit\" class=\"tictail_button tictail_add_to_cart_button\">#{label}</button>"

transformOne = (product) ->
  price = priceToMajor product.price, product.currency
  product =
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
    all_images: _.map product.images, (image) ->
      data = {}
      for size, url of image.sizes
        data['url-'+size] = url
      data
    variations: _.map product.variations, (variation) ->
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
    product.add_to_cart =
      add_to_cart_button: addToCartButton

  product

transform = (response, categorySlug) ->
  response.then (products) ->
    if categorySlug
      products = _.filter products, @inCategory
    data = _.map products, transformOne

    {
      list_page:
        products: data
    }


module.exports =
  addToCartButton: addToCartButton
  transform: transform
