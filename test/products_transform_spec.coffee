{
  addToCartForm
  variationsSelect
  variationsRadio
  addToCartButton
  slideshow
} = require '../lib/transforms/product'
{transform} = require '../lib/transforms/products'


describe 'Product transforms', ->
  it 'should transform empty list of products', ->
    transform([]).should.eql([])

  it 'should transform list of products', ->
    data = [{
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
    }, {
      "status": "published",
      "store_url": "http://blackgoldenretriever.tictail.com",
      "description": "This one is another.",
      "store_name": "VW Store",
      "store_id": "px8",
      "unlimited": false,
      "created_at": "2013-09-22T13:10:38",
      "title": "Another cars",
      "modified_at": "2014-11-23T17:52:43",
      "slug": "another-car",
      "price": 0,
      "currency": "SEK",
      "variations": [
        {
          "title": "Blue",
          "modified_at": "2014-11-23T17:52:43",
          "created_at": "2014-11-23T17:52:43",
          "unlimited": false,
          "id": "mmb5",
          "quantity": 0
        },
        {
          "title": "Red",
          "modified_at": "2014-11-23T17:52:43",
          "created_at": "2014-11-23T17:52:43",
          "unlimited": false,
          "id": "mmb4",
          "quantity": 3
        }
      ],
      "images": [
        {
          "original_height": 1299,
          "sizes": {
            "2000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=2000",
            "30": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=30",
            "300": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=300",
            "45": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=45",
            "50": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=50",
            "40": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=40",
            "640": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=640",
            "75": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=75",
            "100": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=100",
            "500": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=500",
            "1000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=1000"
          },
          "url": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg",
          "created_at": "2013-11-13T21:28:44",
          "modified_at": "2013-11-13T21:28:44",
          "original_width": 1035,
          "id": "auJN"
        },
        {
          "original_height": 3264,
          "sizes": {
            "2000": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=2000",
            "30": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=30",
            "300": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=300",
            "45": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=45",
            "50": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=50",
            "40": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=40",
            "640": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=640",
            "75": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=75",
            "100": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=100",
            "500": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=500",
            "1000": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=1000"
          },
          "url": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg",
          "created_at": "2014-11-23T17:52:43",
          "modified_at": "2014-11-23T17:52:43",
          "original_width": 2448,
          "id": "tEzP"
        }
      ],
      "id": "54V8",
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
          "title": "Tree",
          "created_at": "2014-11-22T09:37:48",
          "modified_at": null,
          "slug": "tree",
          "parent_id": null,
          "product_count": 1,
          "position": 0,
          "id": "3hZv"
        },
        {
          "title": "Wood",
          "created_at": "2014-11-22T09:37:48",
          "modified_at": null,
          "slug": "wood",
          "parent_id": "3hZv",
          "product_count": 1,
          "position": 3,
          "id": "3hZw"
        }
      ],
      "quantity": 3
    }]

    expected = [
      {
        "title": "VW Kleinbus",
        "description": "<h3>Jaja.</h3>\n\nEn skön buss.\n\n<del>asd</del>",
        "url": "/product/vw-kleinbus",
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
        "slideshow-30": slideshow(0),
        "slideshow-40": slideshow(0),
        "slideshow-45": slideshow(0),
        "slideshow-50": slideshow(0),
        "slideshow-75": slideshow(0),
        "slideshow-100": slideshow(0),
        "slideshow-300": slideshow(0),
        "slideshow-500": slideshow(0),
        "slideshow-640": slideshow(0),
        "slideshow-1000": slideshow(0),
        "slideshow-2000": slideshow(0),
        "add_to_cart": addToCartForm,
        "add_to_cart_button": addToCartButton
      },
      {
        "title": "Another cars",
        "description": "This one is another.",
        "url": "/product/another-car",
        "absolute_url": "/product/another-car",
        "identifier": "54V8",
        "price": "0.00 SEK",
        "price_without_currency": 0,
        "price_with_currency": "0 SEK",
        "currency_code": "SEK",
        "quantity_sum": 3,
        "is_quantity_unlimited": false,
        "in_stock": 3,
        "out_of_stock": false,
        "all_images": [
          {
            "url-30": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=30",
            "url-40": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=40",
            "url-45": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=45",
            "url-50": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=50",
            "url-75": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=75",
            "url-100": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=100",
            "url-300": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=300",
            "url-500": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=500",
            "url-640": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=640",
            "url-1000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=1000",
            "url-2000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=2000"
          },
          {
            "url-30": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=30",
            "url-40": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=40",
            "url-45": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=45",
            "url-50": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=50",
            "url-75": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=75",
            "url-100": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=100",
            "url-300": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=300",
            "url-500": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=500",
            "url-640": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=640",
            "url-1000": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=1000",
            "url-2000": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=2000"
          }
        ],
        "variations": [
          {
            "label": "Blue",
            "position": 0,
            "identifier": "mmb5",
            "quantity": 0,
            "is_default": false,
            "in_stock": false,
            "out_of_stock": true
          },
          {
            "label": "Red",
            "position": 0,
            "identifier": "mmb4",
            "quantity": 3,
            "is_default": false,
            "in_stock": 3,
            "out_of_stock": false
          }
        ],
        "primary_image": {
          "url-30": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=30",
          "url-40": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=40",
          "url-45": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=45",
          "url-50": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=50",
          "url-75": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=75",
          "url-100": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=100",
          "url-300": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=300",
          "url-500": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=500",
          "url-640": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=640",
          "url-1000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=1000",
          "url-2000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=2000"
        },
        "slideshow-30": slideshow(0),
        "slideshow-40": slideshow(0),
        "slideshow-45": slideshow(0),
        "slideshow-50": slideshow(0),
        "slideshow-75": slideshow(0),
        "slideshow-100": slideshow(0),
        "slideshow-300": slideshow(0),
        "slideshow-500": slideshow(0),
        "slideshow-640": slideshow(0),
        "slideshow-1000": slideshow(0),
        "slideshow-2000": slideshow(0),
        "add_to_cart": addToCartForm,
        "add_to_cart_button": addToCartButton,
        "variations_radio": variationsRadio,
        "variations_select": variationsSelect
      }
    ]

    transform(data).should.eql(expected)

  it 'should filter out products in categories', ->
    data = [{
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
        }
      ],
      "quantity": null
    }, {
      "status": "published",
      "store_url": "http://blackgoldenretriever.tictail.com",
      "description": "This one is another.",
      "store_name": "VW Store",
      "store_id": "px8",
      "unlimited": false,
      "created_at": "2013-09-22T13:10:38",
      "title": "Another cars",
      "modified_at": "2014-11-23T17:52:43",
      "slug": "another-car",
      "price": 0,
      "currency": "SEK",
      "variations": [
        {
          "title": "Blue",
          "modified_at": "2014-11-23T17:52:43",
          "created_at": "2014-11-23T17:52:43",
          "unlimited": false,
          "id": "mmb5",
          "quantity": 0
        },
        {
          "title": "Red",
          "modified_at": "2014-11-23T17:52:43",
          "created_at": "2014-11-23T17:52:43",
          "unlimited": false,
          "id": "mmb4",
          "quantity": 3
        }
      ],
      "images": [
        {
          "original_height": 1299,
          "sizes": {
            "2000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=2000",
            "30": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=30",
            "300": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=300",
            "45": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=45",
            "50": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=50",
            "40": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=40",
            "640": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=640",
            "75": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=75",
            "100": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=100",
            "500": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=500",
            "1000": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg?size=1000"
          },
          "url": "https://images.ttcdn.co/media/i/product/67486-336838e7176f4c5c8d718af016e11690.jpeg",
          "created_at": "2013-11-13T21:28:44",
          "modified_at": "2013-11-13T21:28:44",
          "original_width": 1035,
          "id": "auJN"
        },
        {
          "original_height": 3264,
          "sizes": {
            "2000": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=2000",
            "30": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=30",
            "300": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=300",
            "45": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=45",
            "50": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=50",
            "40": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=40",
            "640": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=640",
            "75": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=75",
            "100": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=100",
            "500": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=500",
            "1000": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg?size=1000"
          },
          "url": "https://images.ttcdn.co/media/i/product/67486-255ffe2094a54eafa790f344c200afc4.jpeg",
          "created_at": "2014-11-23T17:52:43",
          "modified_at": "2014-11-23T17:52:43",
          "original_width": 2448,
          "id": "tEzP"
        }
      ],
      "id": "54V8",
      "categories": [],
      "quantity": 3
    }]

    transform(data, 'plastic').should.have.lengthOf(1)
    transform(data, null).should.have.lengthOf(2)
    transform(data).should.have.lengthOf(2)
