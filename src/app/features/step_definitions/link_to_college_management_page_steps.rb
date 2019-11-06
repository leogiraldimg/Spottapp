Then(/^I favorited that college/) do
    steps %Q{
        Given I am on the colleges menu page
        When I click on the star icon
        And I go to favorite colleges menu page
        Then I should see the college
    }
end

Then(/^I should see the link to the management page/) do
    expect(page).to have_xpath("//div[@class='block']//a", text: "UT001 - Faculdade Teste 001", count: 1)
    expect(page).to have_xpath("//div[@class='block']//div[@id='manage-edit-and-favorite']//a", text: "Gerenciar", count: 1)
    expect(page).to have_xpath("//div[@class='block']//div[@id='manage-edit-and-favorite']//a", text: "Editar", count: 1)
    expect(page).to have_xpath("//div[@class='block']//div[@id='manage-edit-and-favorite']//a[@id='star-purple']", count: 1)
end

Then(/^I shouldn't see the link to the management page/) do
    expect(page).to have_xpath("//div[@class='block']//a", text: "UT002 - Faculdade Teste 002", count: 1)
    expect(page).to have_xpath("//div[@class='block'][2]//div[@id='manage-edit-and-favorite']//a", text: "Gerenciar", :maximum => 1)
    expect(page).to have_xpath("//div[@class='block'][2]//div[@id='manage-edit-and-favorite']//a", text: "Editar", :maximum => 1)
    expect(page).to have_xpath("//div[@class='block']//div[@id='manage-edit-and-favorite']//a[@id='star']", count: 1)
end