Article.destroy_all


20.times do |index|
  Article.create!(title: Faker::Book.title ,
                description: Faker::Lorem.paragraph,
                content: Faker::Lorem.paragraph(5))
end



p "Created #{Article.count} articles"



