FactoryBot.define do
  factory :tool do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    image { Faker::LoremPixel.image }
    status { Faker::Lorem.word }
    user_id { Faker::Number.within(range: 1..1000) }
    address { Faker::Address.full_address }
    borrower_id { Faker::Number.within(range: 1..1000) }
  end
end
