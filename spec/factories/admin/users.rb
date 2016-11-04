FactoryGirl.define do
  factory :user, class: Admin::User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end
end
