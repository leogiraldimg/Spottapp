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

And(/^I click on the button Adicionar$/) do
    click_button("Adicionar")
end

Then(/^I should see the college settings page with a message informing that the action was a success$/) do
    expect(page).to have_xpath('.//div', text: "Usuário adicionado como administrador")
end