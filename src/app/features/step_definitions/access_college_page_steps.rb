Given (/^I am on the colleges menu$/) do
    visit colleges_path
end

When (/^I click on a link to college$/) do
    find('.name', text: 'UT002 - Faculdade Teste 002').click
    click_link("Entrar")
end

Then (/^I should see the college page$/) do
    expect(page).to have_xpath('.//h2', text: "Universidade Teste 002")
end

Then (/^I should see the UT003 college page$/) do
    expect(page).to have_xpath('.//h2', text: "Universidade Teste 003")
end

Then("I should see empty college page menu") do
    page.should have_no_content('#star-white')
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
    find('.name', text: 'UT001 - Faculdade Teste 001').click
    click_link("Entrar")
end

Then (/^I should see my college page$/) do
    expect(page).to have_xpath('.//h2', text: "Universidade Teste 001")
end

Given (/^I accessed my college page successfully$/) do
    steps %Q{
        Given I am on the colleges menu
        When I click on my college page link
        Then I should see my college page
    }
end