FactoryGirl.define do
  pw = Faker::Internet.password
  factory :user do
    email { Faker::Internet.email }
    password_digest { BCrypt::Password.create(pw) }
    password pw
  end
end
