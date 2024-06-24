User.create!(
  name: ENV["ADMIN_NAME"],
  email: ENV["ADMIN_ADDRESS"],
  password: ENV["ADMIN_PASSWORD"],
  password_confirmation: ENV["ADMIN_PASSWORD"],
  role: true
)
User.create!(
  name: "usertest",
  email: "usertest@example.com",
  password: "nazonazo",
  password_confirmation: "nazonazo",
  role: false
)

IncomeCategory.create!(user_id:2, name: "おこづかい")
IncomeCategory.create!(user_id:2, name: "おてつだい")
IncomeCategory.create!(user_id:2, name: "お年玉")


OutcomeCategory.create!(user_id:2, name: "食費")
OutcomeCategory.create!(user_id:2, name: "文房具")
OutcomeCategory.create!(user_id:2, name: "書籍")
OutcomeCategory.create!(user_id:2, name: "交際費")
OutcomeCategory.create!(user_id:2, name: "おでかけ")
OutcomeCategory.create!(user_id:2, name: "衣服")
