product_image = Product.first.image
product_gallery = Product.first.gallery
30.times do |index|
  Product.create!({
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.decimal(2),
    image: product_image,
    gallery: product_gallery,
    categories: [Category.first],
    tags: [Tag.first]
})
end


p "Created #{Product.count} products"