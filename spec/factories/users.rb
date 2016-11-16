FactoryGirl.define do
  factory :user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end
end
