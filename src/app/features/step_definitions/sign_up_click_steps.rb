Given(/^I am on the create account page$/) do
    visit new_user_path
end

When(/^I fill the user registration form$/) do
    @user = FactoryBot.build(:user)

    fill_in "user[email]", with: @user.email
    fill_in "user[nickname]", with: @user.nickname
    fill_in "user[first_name]", with: @user.first_name
    fill_in "user[last_name]", with: @user.last_name
    fill_in "user[birth_date]", with: @user.birth_date
    fill_in "user[password]", with: @user.password
    fill_in "user[password_confirmation]", with: @user.password_confirmation
    fill_in "user[country]", with: @user.country
    fill_in "user[state]", with: @user.state
    fill_in "user[city]", with: @user.city
end

When (/^I fill the user registration form including the profile picture$/) do
    @user = FactoryBot.build(:user)

    fill_in "user[email]", with: @user.email
    fill_in "user[nickname]", with: @user.nickname
    fill_in "user[first_name]", with: @user.first_name
    fill_in "user[last_name]", with: @user.last_name
    fill_in "user[birth_date]", with: @user.birth_date
    fill_in "user[password]", with: @user.password
    fill_in "user[password_confirmation]", with: @user.password_confirmation
    fill_in "user[country]", with: @user.country
    fill_in "user[state]", with: @user.state
    fill_in "user[city]", with: @user.city
    attach_file("user[profile_picture]", 'features/upload-files/icon-384x384.png')
end

When(/^I click the Cadastrar button$/) do
    click_button "Cadastrar"
end

Then(/^I should see the welcome page$/) do
    expect(page).to have_xpath('.//div[@class="alert alert-success alert-dismissible"]')
    expect(page).to have_xpath('.//form[@action="/users/new"]')
    expect(page).to have_xpath('.//form[@action="/entrar"]')
end

# - - -

Given(/^I have an account$/) do
    steps %Q{
        Given I am on the create account page
        When I fill the user registration form
        And I click the Cadastrar button
        Then I should see the welcome page
    }
end

Given (/^There is an unregistered user$/) do
    u = User.new(:email => "teste002.user@spottapp.com.br", :nickname => "teste002.user", :first_name => "teste002" , :last_name => "user", :password => "teste002user", :password_confirmation => "teste002user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
    u.save

    @user = User.find_by(nickname: "teste002.user")
end

When /^I check the checkbox to see the page's wizard$/ do
    find(:css, "#checkbox").set(true)
end

Then /^I should see the page's wizard$/ do
    expect(page).to have_xpath('.//div[@id="list-near-colleges"]')
end
  