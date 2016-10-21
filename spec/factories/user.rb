FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      n.to_s + Faker::Internet.email
    end
    f_password = Faker::Internet.password
    password { f_password }
    password_confirmation { f_password }
  end
end
