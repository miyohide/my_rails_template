FactoryBot.define do

  sequence(:title) { |n| "title-#{n}"}
  sequence(:body) { |n| "body#{n}-1\nbody#{n}-2"}

  factory :post do
    title
    body
  end
end
