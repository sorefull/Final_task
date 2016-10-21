FactoryGirl.define do
  factory :review do
    body { Faker::Lorem.sentence }
    stars { rand(0..5) }
    user
    product
  end
end
