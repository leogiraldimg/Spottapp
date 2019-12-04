FactoryBot.define do
  factory :like do
    user { User.first || association(:user) }
    spotted { Spotted.first || association(:spotted) }
  end
end
