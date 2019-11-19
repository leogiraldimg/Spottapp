Given(/^I am on the view spotted page$/) do
    click_button("Ver spotted")
end

When(/^I fill the content comment field with some information$/) do
    fill_in "comment[content]", with: "Comment Teste"
end

And(/^I click the Mandar comentário button$/) do
    find("#send-comment-button").click
end

Then(/^I should see the view spotted page$/) do
    expect(page).to have_xpath('.//h2', text: "Spotted n. 1")
end

And(/^I should see my new comment on the timeline$/) do
    expect(page).to have_xpath('.//div', text: "Comment Teste")
end

# - - -

# Given (/^I posted a comment successfully$/) do
#     steps %Q{
#         Given I am on the view spotted page
#         When I fill the content comment field with some information
#         And I click the Mandar comentário button
#         Then I should see the view spotted page
#         And I should see my new comment on the timeline
#     }
# end