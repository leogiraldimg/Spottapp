Given (/^I am on the login page$/) do
    visit "entrar"
end

Given (/^There is an registered user$/) do
    u = User.new(:email => "teste001.user@spottapp.com.br", :nickname => "teste001.user", :first_name => "teste001" , :last_name => "user", :password => "teste001user", :password_confirmation => "teste001user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
    u.save

    @user = User.where(email: u.email).take
end

When (/^I fill the login form with login information$/) do
    fill_in "Email ou usuário", :with => "teste001.user"
    fill_in "Senha", :with => "teste001user"
end

When (/^I click the Entrar button$/) do
    click_button "Entrar"
end

Then (/^I should see the initial user page$/) do
    expect(page).to have_xpath('.//a[@id="pages-menu-access"]') 
end

Given (/^I logged in successfully$/) do
    steps %Q{
        Given I am on the login page
        And There is an registered user
        When I fill the login form with login information
        And I click the Entrar button
        Then I should see the initial user page
    }
end