FactoryBot.define do
  factory :user do
    username { Faker::Lorem.word }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
