require 'rails_helper'

RSpec.describe User, type: :model do
	context "validation tests - required or not" do
		it 'ensures email is required' do
			user = User.new(:email => "", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false) 
		end

		it 'ensures nickname is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures first_name is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures last_name is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures password is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures password_confirmation is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures birth_date is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures city is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures state is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'ensures country is required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "").save

			expect(user).to eq(false)
		end

		it 'ensures profile_picture is not required' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil", :profile_picture => "").save

			expect(user).to eq(true)
		end
	end

	context "validation tests - length" do
		it 'long email' do
			user = User.new(:email => "teste001.user@spottapp.com.brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'long nickname' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.userrrrrrrrrrrrrrrrrrr", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end
		
		it 'long first_name' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.userrrrrrrrrrrrrrrrrrr", :first_name => "teste0011111111111111111111111111111111111111111111", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'long last_name' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "userrrrrrrrrrrrrrrrrrrrrruserrrrrrrrrrrrrrrrrrrrrrr", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'short password' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'short password_confirmation' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'long state' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "São Paulo", :country => "Brasil").save

			expect(user).to eq(false)
		end

		it 'short state' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "S", :country => "Brasil").save

			expect(user).to eq(false)
		end
	end

	context "validation tests - format" do
		it 'wrong email format' do
			user = User.new(:email => "teste001.userspottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(false)

			user = User.new(:email => "teste001.user@", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(false)

			user = User.new(:email => "teste001.user@spottapp", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(false)

			user = User.new(:email => "teste001.user@spottappcombr", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(false)
		end
	end

	context "validation tests - uniqueness" do
		it 'ensures email uniqueness' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(true)

			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(false)
		end

		it 'ensures nickname uniqueness' do
			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(true)

			user = User.new(:email => "teste.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil").save
			expect(user).to eq(false)
		end
	end

	context "validation tests - specific" do
		it 'ensures profile_picture valid format' do

			user = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil", :profile_picture => "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", :profile_picture_content_type => "application/pdf").save

			expect(user).to eq(false)
		end
	end
end
