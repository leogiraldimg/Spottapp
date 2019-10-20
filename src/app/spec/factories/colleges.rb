FactoryBot.define do
	factory :college do
		name {"Universidade Teste 001"}
		initials {"INITIALS"}
		city {"Example City"}
		state {"ES"}
		country {"Sample"}
		unit {"Example"}
		background_color {"#fafafa"}
		font_family {"Arial"}
		background_image {"https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75"}
		font_color {"#fafafa"}
		request_to_participate {"1"}
		admin_approves_spotted {"1"}
		user {User.first || association(:user)}
		id {"1"}
	end
end
