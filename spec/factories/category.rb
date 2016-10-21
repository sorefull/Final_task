FactoryGirl.define do
  factory :category do
    title { Faker::Company.buzzword }
    description { Faker::Lorem.paragraph }
  end
end
