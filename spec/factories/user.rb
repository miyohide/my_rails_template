FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { "secret123" }
    password_confirmation { "secret123" }
    salt { "asdasdastr4325234324sdfds" }
  end
end
