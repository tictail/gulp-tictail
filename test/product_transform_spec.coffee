{transform} = require '../lib/transforms/product'
data = require('./responses/products')[3]


describe 'Product transforms', ->
  it 'should transform a product', ->
    transformedProduct = transform(data)

    transformedProduct.should.be.an.instanceOf(Object)
