Given (/^I am on the colleges menu$/) do
    visit colleges_path
end

When (/^I click on a link to college$/) do
    click_link "UT001 - Faculdade Teste 001"
end

Then (/^I should see the college page$/) do
    expect(page).to have_xpath('.//h2', text: "Spotteds de Universidade Teste 001")
end

Given (/^I accessed a college page successfully$/) do
    steps %Q{
        Given I am on the colleges menu
        When I click on a link to college
        Then I should see the college page
    }
end