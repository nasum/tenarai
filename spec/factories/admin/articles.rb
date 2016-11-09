FactoryGirl.define do
  factory :article, class: Admin::Article do
    content { Faker::Lorem.sentence }
    status { 0 }
    user { FactoryGirl.create :user }
  end

  factory :published_article, class: Admin::Article do
    content { Faker::Lorem.sentence }
    status { 1 }
    user { FactoryGirl.create :user }
  end
end
