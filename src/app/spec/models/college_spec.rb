require 'rails_helper'

RSpec.describe College, type: :model do
	context "validation tests - required or not" do
		it 'ensures name is required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it 'ensures that initials is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that city is required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it 'ensures that state is required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it 'ensures that country is required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it 'ensures that unit is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that background_color is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that font_family is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that background_image is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that font_color is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that request_to_participate is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that admin_approves_spotted is not required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', user: @user).save

			expect(college).to eq(true)
		end

		it 'ensures that user is required' do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1').save

			expect(college).to eq(false)
		end
	end

	context "validation tests - length" do
		it "long name" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 00000000000000000000000000000000000000000000001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end
		
		it "long initials" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALSS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it "long city" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City example example ex', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it "long state" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ESS', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it "long country" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'SampleSampleSampleSampleSampleS', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it "long unit" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'ExampleExampleExample', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it "long font_family" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'ArialArialArialArialArialArialA', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end
	end

	context "validation tests - specific" do
		it "invalid background_color - invalid code" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#12', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end

		it "invalid font_color - invalid code" do
			u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

			college = College.new(name: 'Universidade Teste 001', initials: 'INITIALS', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#12', request_to_participate: '1', admin_approves_spotted: '1', user: @user).save

			expect(college).to eq(false)
		end
	end
end
