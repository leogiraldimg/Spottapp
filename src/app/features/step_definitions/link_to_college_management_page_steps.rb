Then(/^I favorited that college/) do
    steps %Q{
        Given I am on the colleges menu page
        When I click on the star icon
        And I go to favorite colleges menu page
        Then I should see the college
    }
end

Then(/^I should see the link to the management page/) do
    pending
end

Then(/^I shouldn't see the link to the management page/) do
    pending
end