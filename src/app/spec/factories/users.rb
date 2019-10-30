FactoryBot.define do
	factory :user do
		email {"teste001.user@spottapp.com.br"}
		nickname {"teste001.user"}
		first_name {"teste001"}
		last_name {"user"}
		password {"teste001user"}
		password_confirmation {"teste001user"}
		birth_date {"1998-10-25"}
		city {"São Paulo"}
		state {"SP"}
		country {"Brasil"}
	end
end
