{transform, addToCartForm, addToCartButton, saveButton, priceTag, variationsSelect} = require '../lib/transforms/product'
data = require('./responses/products')[3]


describe 'Product transforms', ->
  it 'should transform a product', ->
    expected =
      title: 'Logo Sticker Mix Pack'
      description: "Be like <a rel=\"nofollow\" target=\"_blank\" href=\"http://www.svd.se/naringsliv/svenska-it-hopp-ska-erovra-varlden_6841413.svd\">Ted Valentin</a> and rock the whole scene!\n<br /><br />\n1 x Bloglovin <br />1 x Filibaba<br />\n1 x GuidePal<br />\n1 x iZettle<br />\n1 x Klarna <br />\n1 x Kundo <br />\n1 x Readmill  <br />\n1 x Spotify <br />\n1 x The Startup Store  <br />\n1 x Tictail<br />\n1 x Tripbirds  <br /> \n1 x Tripl  <br /> \n1 x Wrapp\n<br /><br />\n<i>Macbook not included :)</i>"
      url: 'product/logo-sticker-mix-pack-482'
      absolute_url: '/product/logo-sticker-mix-pack-482'
      identifier: 'aC'
      price: '35.00 <span class="currency currency_sek">SEK</span>'
      price_tag: priceTag()
      price_without_currency: 35
      price_with_currency: priceTag()
      currency_code: "SEK"
      quantity_sum: null
      is_quantity_unlimited: true
      in_stock: true
      out_of_stock: false
      all_images: [
        {
          "url-100": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=100'
          "url-1000": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=1000'
          "url-2000": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=2000'
          "url-30": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=30'
          "url-300": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=300'
          "url-40": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=40'
          "url-45": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=45'
          "url-50": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=50'
          "url-500": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=500'
          "url-640": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=640'
          "url-75": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=75'
        }
      ],
      variations: [
        identifier: 'uNEU'
        in_stock: true
        is_default: true
        label: 'Stor'
        out_of_stock: false
        position: 0
        quantity: null
      ,
        identifier: '36Vrz'
        in_stock: true
        is_default: false
        label: 'Liten'
        out_of_stock: false
        position: 1
        quantity: null
      ]
      primary_image: {
        "url-100": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=100'
        "url-1000": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=1000'
        "url-2000": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=2000'
        "url-30": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=30'
        "url-300": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=300'
        "url-40": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=40'
        "url-45": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=45'
        "url-50": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=50'
        "url-500": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=500'
        "url-640": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=640'
        "url-75": 'https://imgix.ttcdn.co/i/product/original/0/25-7f8de7033c964b45b2c39306046f1963.png?w=75'
      },
      add_to_cart: addToCartForm
      add_to_cart_button: addToCartButton
      save_button: saveButton
      sale_active: true
      variations_select: variationsSelect data.variations.length

    transformedProduct = transform(data)

    transformedProduct.should.eql(expected)

    transformedProduct.price_tag().should.eql '''<span class="price_tag"><span class="original_price"
      style="text-decoration: line-through">50.00 <span class="currency currency_sek">SEK</span></span> <span
      class="sale_price">35.00 <span class="currency currency_sek">SEK</span></span></span>'''
