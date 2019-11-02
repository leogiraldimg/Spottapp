Given (/^I am on the colleges menu$/) do
    visit colleges_path
end

When (/^I click on a link to college$/) do
    click_link "UT002 - Faculdade Teste 002"
end

Then (/^I should see the college page$/) do
    expect(page).to have_xpath('.//h2', text: "Spotteds de Universidade Teste 002")
end

# - - -

Given (/^I accessed a college page successfully$/) do
    steps %Q{
        Given I am on the colleges menu
        When I click on a link to college
        Then I should see the college page
    }
end

When (/^I click on my college page link$/) do
    click_link "UT001 - Faculdade Teste 001"
end

Then (/^I should see my college page$/) do
    expect(page).to have_xpath('.//h2', text: "Spotteds de Universidade Teste 001")
end

Given (/^I accessed my college page successfully$/) do
    steps %Q{
        Given I am on the colleges menu
        When I click on my college page link
        Then I should see my college page
    }
end