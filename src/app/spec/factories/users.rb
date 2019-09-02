FactoryBot.define do
  factory :user do
    email { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    password_digest { "MyString" }
    birth_date { "2019-09-01" }
  end
end
