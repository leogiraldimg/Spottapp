require 'rails_helper'

RSpec.describe FavoriteCollege, type: :model do
	context "validation tests - required or not" do		
		it 'ensures that user is required' do
			college = College.new(initials: 'INITIALS', name: 'Universidade Teste 001', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user)
			college.save

			favorite_college = FavoriteCollege.new(college: college).save
			
			expect(favorite_college).to eq(false)
		end

		it 'ensures that college is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			user.save

			favorite_college = FavoriteCollege.new(user: user).save
			
			expect(favorite_college).to eq(false)
		end
	end
end
