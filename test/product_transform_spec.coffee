{
  transform
  addToCartForm
  addToCartButton
} = require '../lib/transforms/product'


describe 'Product transforms', ->
  it 'should transform a product', ->
    data =
      "status": "published",
      "store_url": "http://blackgoldenretriever.tictail.com",
      "description": "<h3>Jaja.</h3>\n\nEn sk\u00f6n buss.\n\n<del>asd</del>",
      "store_name": "VW Store",
      "store_id": "px8",
      "unlimited": true,
      "created_at": "2013-09-15T09:25:22",
      "title": "VW Kleinbus",
      "modified_at": "2014-12-17T11:17:16",
      "slug": "vw-kleinbus",
      "price": 0,
      "currency": "SEK",
      "variations": [
        {
          "title": null,
          "modified_at": "2013-11-13T07:56:14",
          "created_at": "2013-09-15T09:25:22",
          "unlimited": true,
          "id": "6vmw",
          "quantity": null
        }
      ],
      "images": [
        {
          "original_height": 608,
          "sizes": {
            "2000": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=2000",
            "30": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=30",
            "300": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=300",
            "45": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=45",
            "50": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=50",
            "40": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=40",
            "640": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=640",
            "75": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=75",
            "100": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=100",
            "500": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=500",
            "1000": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=1000"
          },
          "url": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png",
          "created_at": "2013-09-15T09:25:22",
          "modified_at": "2013-09-15T09:25:22",
          "original_width": 944,
          "id": "8kgD"
        }
      ],
      "id": "4XfN",
      "categories": [
        {
          "title": "Plastic",
          "created_at": "2014-11-22T09:37:48",
          "modified_at": null,
          "slug": "plastic",
          "parent_id": null,
          "product_count": 2,
          "position": 2,
          "id": "WZj"
        },
        {
          "title": "Test",
          "created_at": "2014-11-22T09:37:48",
          "modified_at": null,
          "slug": "test",
          "parent_id": null,
          "product_count": 1,
          "position": 1,
          "id": "57Vr"
        },
        {
          "title": "Foo",
          "created_at": "2014-11-22T09:37:22",
          "modified_at": null,
          "slug": "foo",
          "parent_id": "57Vr",
          "product_count": 1,
          "position": 5,
          "id": "57Vt"
        }
      ],
      "quantity": null

    expected =
      "title": "VW Kleinbus",
      "description": "<h3>Jaja.</h3>\n\nEn skön buss.\n\n<del>asd</del>",
      "url": "product/vw-kleinbus",
      "absolute_url": "/product/vw-kleinbus",
      "identifier": "4XfN",
      "price": "0.00 SEK",
      "price_without_currency": 0,
      "price_with_currency": "0 SEK",
      "currency_code": "SEK",
      "quantity_sum": null,
      "is_quantity_unlimited": true,
      "in_stock": true,
      "out_of_stock": false,
      "all_images": [
        {
          "url-30": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=30",
          "url-40": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=40",
          "url-45": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=45",
          "url-50": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=50",
          "url-75": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=75",
          "url-100": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=100",
          "url-300": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=300",
          "url-500": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=500",
          "url-640": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=640",
          "url-1000": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=1000",
          "url-2000": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=2000"
        }
      ],
      "variations": [],
      "primary_image": {
        "url-30": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=30",
        "url-40": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=40",
        "url-45": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=45",
        "url-50": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=50",
        "url-75": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=75",
        "url-100": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=100",
        "url-300": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=300",
        "url-500": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=500",
        "url-640": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=640",
        "url-1000": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=1000",
        "url-2000": "https://images.ttcdn.co/media/i/product/67486-1c6a74f6d81e40e4a88f7d45b3d21126.png?size=2000"
      },
      "add_to_cart": addToCartForm,
      "add_to_cart_button": addToCartButton,

    transform(data).should.eql(expected)
