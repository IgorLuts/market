# Category.destroy_all
# Article.destroy_all

# Category.create!([
#   { name: "Шведские стенки"},
#   { name: "Шведские стенки для детей"},
#   { name: "Шведские стенки для взрослых"},
#   { name: "Шведские стенки для всей семьи"},
#   { name: "Детские спортивные уголки"},
#   { name: "Детские спортивные комплексы"},
#   { name: "Спортивные уголки 'Ранний старт'"},
#   { name: "Аксессуары"},
#   { name: "Спортивные товары для детей"},
#   { name: "Турники настенные"},
#   { name: "Брусья настенные"},
#   { name: "Маты спортивные"},
#   { name: "Штанги наборные"},
#   { name: "Наборные гантели"},
#   { name: "Блины для штанги"},
#   { name: "Грифы для штанги"}
# ])

# 30.times do |index|
#   Article.create!({
#     title: Faker::Commerce.product_name,
#     content: Faker::Lorem.paragraph,
#     description: Faker::Lorem.paragraph(10)
# })
# end

# AdminUser.create!(email: 'alexxty7@gmail.com', password: '2580gott', password_confirmation: '2580gott')

# p "Created #{Article.count} Articles"

# p "Created #{Category.count} categories"

categ1 = Category.find_by(name: "Шведские стенки для детей")
categ2 = Category.find_by(name: "Шведские стенки для взрослых")
categ3 = Category.find_by(name: "Шведские стенки для всей семьи")

product = Product.take

10.times do |index|
  Product.create!({
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(10),
    image: product.image,
    price: rand(1000) + 1,
    gallery: product.gallery,
    category: categ1,
    tags: product.tags

  })
end
10.times do |index|
  Product.create!({
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(10),
    image: product.image,
    price: rand(1000) + 1,
    gallery: product.gallery,
    category: categ2,
    tags: product.tags
  })
end
10.times do |index|
  Product.create!({
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(10),
    image: product.image,
    price: rand(1000) + 1,
    gallery: product.gallery,
    category: categ3,
    tags: product.tags
  })
end

p "Created #{Product.count} products"
