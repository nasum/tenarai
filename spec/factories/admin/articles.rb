FactoryGirl.define do
  factory :article, class: Admin::Article do
    content { Faker::Lorem.sentence }
    user { FactoryGirl.create :user }
  end
end
