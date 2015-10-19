Category.destroy_all
Category.create!([
  { name: "Шведские стенки"}, 
  { name: "Шведские стенки для детей"},
  { name: "Шведские стенки для взрослых"},
  { name: "Шведские стенки для всей семьи"},
  { name: "Детские спортивные уголки"},
  { name: "Детские спортивные комплексы"},
  { name: "Спортивные уголки 'Ранний старт'"},
  { name: "Аксессуары"},
  { name: "Спортивные товары для детей"},
  { name: "Турники настенные"},
  { name: "Брусья настенные"},
  { name: "Маты спортивные"},
  { name: "Штанги наборные"},
  { name: "Наборные гантели"},
  { name: "Блины для штанги"},
  { name: "Грифы для штанги"}
])


AdminUser.create!(email: 'alexxty7@gmail.com', password: '2580gott', password_confirmation: '2580gott')


p "Created #{Category.count} categories"
