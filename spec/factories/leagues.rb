FactoryBot.define do
  factory :league do
    name  { Faker::Team.name }
    price { rand(500..5000) }
    lat   { Faker::Address.latitude.round }
    lng   { Faker::Address.longitude.round }
  end
end
