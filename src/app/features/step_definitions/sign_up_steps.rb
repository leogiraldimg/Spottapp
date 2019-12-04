Given(/^I am on the create account page$/) do
    visit new_user_path
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
    fill_in(field.gsub(' ', '_'), :with => value)
end

When /^I fill the user registration form$/ do
    steps %Q{
        When I fill in "user_first_name" with "teste001"
        When I fill in "user_last_name" with "user"
        When I fill in "user_nickname" with "teste001.user"
        When I fill in "user_birth_date" with "1998-10-25"
        When I fill in "user_email" with "teste001.user@spottapp.com.br"
        When I fill in "user_password" with "teste001user"
        When I fill in "user_password_confirmation" with "teste001user"
        When I fill in "user_country" with "Brasil"
        When I fill in "user_state" with "SP"
        When I fill in "user_city" with "São Paulo"
    }
end

When /^I attach a profile picture$/ do
    attach_file("user[profile_picture]", 'features/upload-files/icon-384x384.png')
end

When /^I click the (.*) button$/ do |button_name|
    click_button button_name
end

When /^I check the checkbox to see the page's wizard$/ do
    find(:css, "#checkbox").set(true)
end

Then(/^I should see the welcome page$/) do
    expect(page).to have_xpath('.//div[@class="alert alert-success alert-dismissible"]')
    expect(page).to have_xpath('.//form[@action="/users/new"]')
    expect(page).to have_xpath('.//form[@action="/entrar"]')
end

Then /^I should see the page's wizard$/ do
    expect(page).to have_xpath('.//div[@class="jumbotron"]/h2', text: 'Páginas de instituições próximas')
end
  
Then (/^I should see the red failed toast$/)  do
    expect(page).to have_xpath('.//div[@class="alert alert-danger"]')
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
    u = User.new(:email => "teste002.user@spottapp.com.br",
        :nickname => "teste002.user",
        :first_name => "teste002" ,
        :last_name => "user",
        :password => "teste002user",
        :password_confirmation => "teste002user",
        :birth_date => "10/10/1998",
        :city => "São Paulo",
        :state => "SP",
        :country => "Brasil")
    u.save

    @user = User.find_by(nickname: "teste002.user")
end

Given (/^There is another unregistered user$/) do
    u = User.new(:email => "teste003.user@spottapp.com.br",
        :nickname => "teste003.user",
        :first_name => "teste003" ,
        :last_name => "user",
        :password => "teste003user",
        :password_confirmation => "teste003user",
        :birth_date => "10/11/1998",
        :city => "São Paulo",
        :state => "SP",
        :country => "Brasil")
    u.save

    @user = User.find_by(nickname: "teste003.user")
end