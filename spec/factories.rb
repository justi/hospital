FactoryBot.define do
  factory :user, class: User do
    email {"joe@gmail.com"}
    password {"blah123"}
    pesel {"12345678901"}
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    pesel { Faker::Number.number(11) }
  end
end