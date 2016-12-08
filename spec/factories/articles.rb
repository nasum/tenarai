FactoryGirl.define do
  factory :article, class: Article do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    status { 0 }
    user { FactoryGirl.create :user }
  end

  factory :published_article, class: Article do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    status { 1 }
    user { FactoryGirl.create :user }
  end
end
