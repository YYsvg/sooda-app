IncomeCategory.create(name: "おこづかい")
IncomeCategory.create(name: "おてつだい")
IncomeCategory.create(name: "お年玉")


OutcomeCategory.create(name: "食費")
OutcomeCategory.create(name: "文房具")
OutcomeCategory.create(name: "書籍")
OutcomeCategory.create(name: "交際費")
OutcomeCategory.create(name: "おでかけ")
OutcomeCategory.create(name: "衣服")

User.create!(
  name: ENV["ADMIN_NAME"],
  email: ENV["ADMIN_ADDRESS"],
  password: ENV["ADMIN_PASSWORD"],
  password_confirmation: ENV["ADMIN_PASSWORD"],
  role: true
)
