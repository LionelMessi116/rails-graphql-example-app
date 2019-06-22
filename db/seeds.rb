User.create(name: 'Test_1')

product_1 = Product.create(name: 'Product_1')
product_2 = Product.create(name: 'Product_2')
product_3 = Product.create(name: 'Product_3', deleted: true)

ProductItem.create(color: 'white', price: 100, product: product_1)
ProductItem.create(color: 'black', price: 200, product: product_1)

ProductItem.create(color: 'green', price: 100, product: product_2)
ProductItem.create(color: 'black', price: 250, product: product_2)
