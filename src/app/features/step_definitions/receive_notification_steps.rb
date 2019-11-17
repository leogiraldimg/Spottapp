Given("I click on bell button") do
  find('a.dropdown-toggle3').click 
end

Then("I should see my notifications") do
  expect(page).to have_xpath('.//div', text: "Novo comentário")
end