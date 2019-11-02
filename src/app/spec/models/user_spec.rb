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
end
