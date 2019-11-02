FactoryBot.define do
  factory :comment do
    content {"Comment Test"}
    user {User.first || association(:user)}
    spotted {Spotted.first || association(:spotted)}
	end
end
