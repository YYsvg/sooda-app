# Userモデル

User.create!(
  email: 'test@test.com',
  name: 'テスト太郎',
  password: 'password123'
)

# IncomeCategoryモデル
4.times do |n|
  IncomeCategory.create!(
    name: "テスト#{n}"
  )
end

#  OutcomeCategoryモデル
4.times do |n|
  OutcomeCategory.create!(
    name: "テスト#{n}"
  )
end

