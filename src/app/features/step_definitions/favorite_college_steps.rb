Given(/^I am on the colleges menu page$/) do
    visit colleges_path
end
  
When(/^I click on the star icon$/) do
    find('#star-purple').click
end

Then(/^The star icon must change to yellow$/) do
    find('#star-purple')
end

When(/^I go to favorite colleges menu page$/) do
    visit favorite_colleges_path
end

Then(/^I should see the college$/) do
    find('.block')
end