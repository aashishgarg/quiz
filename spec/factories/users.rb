FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::Name.first_name }
    password { 'Welcome@123' }
    password_confirmation { 'Welcome@123' }
  end
end
