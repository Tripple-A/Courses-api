FactoryBot.define do
  factory :course do
    title { Faker::Lorem.word }
    shortDescription { Faker::Lorem.word }
    url { Faker::Lorem.word }
    imgUrl { Faker::Lorem.word }
    providerRatings { 4.0 }
    duration { Faker::Lorem.word }
    provider { Faker::Lorem.word }
    author { Faker::Lorem.word }
    level { Faker::Lorem.word }
    medium { Faker::Lorem.word }
    language { Faker::Lorem.word }
    category { Faker::Lorem.word }
    broad_category { Faker::Lorem.word }
    tags { Faker::Lorem.word }
  end
end
