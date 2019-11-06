require 'rails_helper'

RSpec.describe Administrator, type: :model do
  context "validation tests - required or not" do
    it 'ensures user_id is required' do
      u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
      u.save
      @user = User.where(nickname: u.nickname).take

      college = College.new(name: 'Universidade Teste 001', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user)
      college.save
      @college = College.where(name: college.name).take

      administrator = Administrator.new(:college_id => @college.id).save
      
      expect(administrator).to eq(false)
    end

    it 'ensures college_id is required' do
      u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
      u.save
      @user = User.where(nickname: u.nickname).take

      administrator = Administrator.new(:user_id => @user.id).save
      
      expect(administrator).to eq(false)
    end
  end

end
