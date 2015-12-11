Article.destroy_all
30.times do |index|
  Article.create!({
    title: Faker::Commerce.product_name,
    content: Faker::Lorem.paragraph,
    description: Faker::Lorem.paragraph(10)
})
end

p "Created #{Article.count} Articles"