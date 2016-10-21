FactoryGirl.define do
  factory :product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
    remote_image_url { Faker::Avatar.image }
    category
  end
end
