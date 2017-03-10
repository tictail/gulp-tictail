{transform} = require '../lib/transforms/product'
transformProduct = transform
{transform} = require '../lib/transforms/products'
data = require './responses/products'


describe 'Product transforms', ->
  it 'should transform empty list of products', ->
    transform([]).should.eql([])

  it 'should transform list of products', ->
    transformedProducts = transform(data)

    transformedProducts.should.have.lengthOf 19
    transformedProducts[0].should.eql transformProduct data[0]

  it 'should filter out products in categories', ->
    transform(data, 'musical-instruments').should.have.lengthOf 2
    transform(data, null).should.have.lengthOf data.length
    transform(data).should.have.lengthOf data.length
