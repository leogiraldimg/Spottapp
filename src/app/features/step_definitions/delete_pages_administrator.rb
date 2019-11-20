Given(/^I am on the page's list of administrators$/) do
    visit favorite_colleges_path
    click_link("Editar")
    click_button("Ver lista de administradores")
    expect(page).to have_xpath('.//legend', text: "Administradores da página: Universidade Teste 001")
    expect(page).to have_content("teste002")
end

When(/^I click on the trash button associated with a administrator$/) do
    find('#trash-bt').click()
end

Then(/^I should see the list without the administrator that I choose$/) do
    expect(page).to have_xpath('.//legend', text: "Administradores da página: Universidade Teste 001")
    expect(page).not_to have_content("teste002")
end

And(/^I should see a success message$/) do 
    expect(page).to  have_xpath('.//div', text: "O administrador foi excluído")
end
