require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "validation tests - required or not" do
    it 'ensures content is required' do
      u = User.new(:email => "teste002.user@spottapp.com.br", :nickname => "teste002.user", :first_name => "teste001", :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
			u.save
      @user = User.where(email: u.email).take

      
      col = College.new(name: 'Universidade Teste 001', city: 'Example City', state: 'ES', country: 'Sample', unit: 'Example', background_color: '#fafafa', font_family: 'Arial', background_image: 'https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75', font_color: '#fafafa', request_to_participate: '1', admin_approves_spotted: '1', user: @user)
      col.save
      @college = College.where(name: col.name).take

      spotted = Spotted.new(content: "Teste 001", image: "https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75", user: @user, college:@college)
      spotted.save
      @spotted = Spotted.where(content: spotted.content).take

      comment = Comment.new(content: "", user: @user, spotted: @spotted).save
      expect(comment).to eq(false) 
    end
  end
end
