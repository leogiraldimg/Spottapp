Given(/^There is more than one user registered$/) do
    u = User.new(:email => "teste002.user@spottapp.com.br", :nickname => "teste002.user", :first_name => "teste002" , :last_name => "user", :password => "teste002user", :password_confirmation => "teste002user", :birth_date => "10/10/1998", :city => "São Paulo", :state => "SP", :country => "Brasil")
    u.save

    @user = User.where(nickname: u.nickname).take
end

And(/^I am on the settings page of a college$/) do
    visit favorite_colleges_path
    click_link("Editar")
end

When(/^I fill the nickname field to a new administrator$/) do
    fill_in "user[nickname]", with: "teste002.user"
end

When(/^I fill the user's nickname field to a new administrator, but this nickname do not exist$/) do
    fill_in "user[nickname]", with: "aaabbbccc"
end

When(/^I fill the user's nickname field to a new administrator, but this user is the owner of the page$/) do
    fill_in "user[nickname]", with: "teste001.user"
end

Then(/^I should see the college settings page with a message informing that the action was a success$/) do
    expect(page).to have_xpath('.//div', text: "Usuário adicionado como administrador")
end

Then(/^I should see the college settings page with a message informing that the user was not found$/) do
    expect(page).to have_xpath('.//div', text: "Nenhum usuário encontrado com esse nome")
end

Then(/^I should see the college settings page with a message informing that the user is already owner page and administrator$/) do
    expect(page).to have_xpath('.//div', text: "Usuário é o criador e administrador da página")
end

Then(/^I should see the college settings page with a message informing that the user is already a administrator$/) do
    expect(page).to have_xpath('.//div', text: "Usuário já é administrador")
end

Given(/^I already defined the user as administrator$/) do
    steps %Q{
        Given There is more than one user registered 
        And I am on the settings page of a college
        When I fill the nickname field to a new administrator
        And I click the Adicionar button
        Then I should see the college settings page with a message informing that the action was a success
    }
end
