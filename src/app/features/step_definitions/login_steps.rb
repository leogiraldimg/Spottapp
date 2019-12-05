Given (/^I am on the login page$/) do
    visit "entrar"
end

When (/^I fill the login form with login information$/) do
    fill_in "Email ou usuário", :with => "teste001.user"
    fill_in "Senha", :with => "teste001user"
end

Then (/^I should see the initial user page$/) do
    expect(page).to have_xpath('.//input[@id="pages-menu-access"]') 
end

When(/^I fill the login form with invalid login information$/) do
    fill_in "Email ou usuário", :with => "email errado"
    fill_in "Senha", :with => "senha errada"
end

Then("I should see the failed toast") do
    expect(page).to have_xpath('.//div[@class="alert alert-danger alert-dismissible"]')
end


# - - -

Given (/^I logged in successfully$/) do
    steps %Q{
        Given I have an account
        And I am on the login page
        When I fill the login form with login information
        And I click the Entrar button
        Then I should see the initial user page
    }
    @user = User.find_by(nickname: "teste001.user")
end