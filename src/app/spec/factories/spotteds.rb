FactoryBot.define do
  factory :spotted do
		content {"Spotted Teste"}
		image {"https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75"}
    user {User.first || association(:user)}
    college {College.first || association(:college)}
	end
end
