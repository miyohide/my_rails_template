FactoryBot.define do
  factory :user do
    email { "a@example.com" }
    password { "secret123" }
    password_confirmation { "secret123" }
    salt { "asdasdastr4325234324sdfds" }
  end
end
