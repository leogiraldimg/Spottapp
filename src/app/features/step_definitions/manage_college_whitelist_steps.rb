And (/^I click to enter the management page$/) do
    click_link("Gerenciar")
end

Then (/^I should see the management page$/) do
    expect(page).to have_xpath(".//h2", text: "Permissões de entrada")
end

Given (/^I am at the favorite college menu page$/) do
    steps %Q{
        Given There is a college page with request needed created
        And I logged in successfully
        Then I favorited that college
        And I created a college page
        And I go to favorite colleges menu page
    }
end

Then (/^I entered the management page$/) do
    steps %Q{
        And I click to enter the management page
        Then I should see the management page
    }
end

Given (/^There is someone on the pending list$/) do
    expect(page).to have_xpath(".//div[@class='pending']/div[@class='tbody']/table/tr/td[1][@class='column-name']", text: "teste003 user")
end

Then (/^It should appear in the approved list$/) do
    expect(page).to have_xpath(".//div[@class='approved']/div[@class='tbody']/table/tr/td[1][@class='column-name']", text: "teste003 user")
end

Then (/^It should appear in the rejected list$/) do
    expect(page).to have_xpath(".//div[@class='rejected']/div[@class='tbody']/table/tr/td[1][@class='column-name']", text: "teste003 user")
end

Then (/^It should appear in the pending list$/) do
    expect(page).to have_xpath(".//div[@class='pending']/div[@class='tbody']/table/tr/td[1][@class='column-name']", text: "teste003 user")
end

Given (/^There is someone on the approved list$/) do
    expect(page).to have_xpath(".//div[@class='approved']/div[@class='tbody']/table/tr/td[1][@class='column-name']", text: "teste003 user")
end

Given (/^There is someone on the rejected list$/) do
    expect(page).to have_xpath(".//div[@class='rejected']/div[@class='tbody']/table/tr/td[1][@class='column-name']", text: "teste003 user")
end

Given (/^Someone has been approved$/) do
    steps %Q{
        Given There is someone on the pending list
        And I click the Aprovar button
        Then It should appear in the approved list
    }
end

Given (/^Someone has been rejected$/) do
    steps %Q{
        Given There is someone on the pending list
        And I click the Rejeitar button
        Then It should appear in the rejected list
    }
end