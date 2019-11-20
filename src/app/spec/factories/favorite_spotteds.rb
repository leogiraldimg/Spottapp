FactoryBot.define do
  factory :favorite_spotted do
    user {User.first || association(:user)}
    spotted {Spotted.first || association(:spotted)}
  end
end
