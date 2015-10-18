Product.destroy_all
Category.destroy_all


10.times do |index|
  Product.create!(title: Faker::Commerce.product_name,
                description: Faker::Lorem.paragraph,
                price: Faker::Number.decimal(2),
                image: "http://lorempixel.com/220/200/sports/#{index}")
end

p "Created #{Product.count} products"