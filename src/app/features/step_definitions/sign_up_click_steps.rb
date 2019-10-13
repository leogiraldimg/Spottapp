Given(/^I am on the create account page$/) do
    visit new_user_path
end

When(/^I fill the user registration form$/) do
    fill_in "user[email]", with: "teste001.user@spottapp.com.br"
    fill_in "user[nickname]", with: "teste001.user"
    fill_in "user[first_name]", with: "teste001"
    fill_in "user[last_name]", with: "user"
    fill_in "user[birth_date]", with: "10/10/1998"
    fill_in "user[password]", with: "teste001user"
    fill_in "user[password_confirmation]", with: "teste001user"
    fill_in "user[country]", with: "Brasil"
    fill_in "user[state]", with: "SP"
    fill_in "user[city]", with: "São Paulo"
end

When(/^I click the Cadastrar button$/) do
    click_button "Cadastrar"
end

Then(/^I should see the welcome page$/) do
    expect(page).to have_xpath('.//div[@class="alert alert-success alert-dismissible"]')
    expect(page).to have_xpath('.//a[@href="/users/new"]')
    expect(page).to have_xpath('.//a[@href="/entrar"]')
end