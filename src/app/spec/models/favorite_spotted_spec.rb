require 'rails_helper'

RSpec.describe FavoriteSpotted, type: :model do
  context "validation tests - required or not" do
    it 'ensures user is required' do
      u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take

      
      col = College.new(name: 'Universidade Teste 001', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user)
      col.save
      @college = College.where(name: col.name).take

      spotted = Spotted.new(content: "bla", image: "https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75", user: @user, college:@college)
      spotted.save
      @spotted = Spotted.where(content: spotted.content).take
      
      favorite_spotted = FavoriteSpotted.new(spotted: @spotted).save
      expect(favorite_spotted).to eq(false) 
    end

    it 'ensures spotted is required' do
      u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
			@user = User.where(email: u.email).take
      
      favorite_spotted = FavoriteSpotted.new(user: @user).save
      expect(favorite_spotted).to eq(false) 
    end
  end
end
