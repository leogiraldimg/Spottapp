When(/^I fill the content comment field with some information$/) do
    fill_in "comment[content]", with: "Comment Teste"
end

And(/^I click the Mandar comentário button icon$/) do
    find("#send-comment-button").click
end

Then(/^I should see the view spotted page$/) do
    expect(page).to have_xpath('.//h2', text: "Spotted n.")
end

And(/^I should see my new comment on the timeline$/) do
    expect(page).to have_xpath('.//div', text: "Comment Teste")
end

When(/^I dont fill the content comment field$/) do
    fill_in "comment[content]", with: ""
end

# - - -

Given (/^I posted a comment successfully$/) do
    steps %Q{
        Given I click the Ver spotted button
        When I fill the content comment field with some information
        And I click the Mandar comentário button icon
        Then I should see the view spotted page
        And I should see my new comment on the timeline
    }

    u = Comment.new(:content => "Comment Test", :user_id => @user.id, :spotted_id => @spotted_id)
    u.save

    @comment = Comment.find_by(content: "Comment Test")


end

Given (/^There is a comment created$/) do
    steps %Q{
        Given There is a spotted created
    }

    u = Comment.new(:content => "Comment Test", :user_id => @user.id, :spotted_id => @spotted.id)
    u.save

    @comment = Comment.find_by(content: "Comment Test")
end

