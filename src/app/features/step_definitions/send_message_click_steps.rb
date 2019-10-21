Given(/^I am on the Contact page$/) do
    visit contact_index_path
end

When(/^I fill the Contact form$/) do
    fill_in "contact[email]", with: "teste001.user@spottapp.com.br"
    fill_in "contact[name]", with: "teste001"
    fill_in "contact[message]", with: "teste001"
end

When(/^I click the Enviar Mensagem button$/) do
    click_button "Enviar Mensagem"
end

Then(/^I should see the green success toast$/) do
    expect(page).to have_xpath('.//div[@class="alert alert-success alert-dismissible"]')
end