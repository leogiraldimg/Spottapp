When(/^I fill the content spotted field with some information$/) do
    fill_in "spotted[content]", with: "Spotted Teste"
end

And(/^I should see my new spotted on the timeline$/) do
    expect(page).to have_xpath('.//div', text: "Spotted Teste")
end

# - - -

Given (/^I posted a spotted successfully on the college page$/) do
    steps %Q{
        Given I click the Novo spotted button
        When I fill the content spotted field with some information
        And I click the Mandar spotted button
        Then I should see the college page
        And I should see my new spotted on the timeline
    }

    u = Spotted.new(:content => "Spotted Teste", :user_id => @user.id, :college_id => @college_id)
    u.save

    @spotted = Spotted.find_by(content: "Spotted")
end

Given (/^I posted a spotted successfully on my college page$/) do
    steps %Q{
        Given I click the Novo spotted button
        When I fill the content spotted field with some information
        And I click the Mandar spotted button
        Then I should see my college page
        And I should see my new spotted on the timeline
    }

    u = Spotted.new(:content => "Spotted Teste", :user_id => @user.id, :college_id => @college_id)
    u.save

    @spotted = Spotted.find_by(content: "Spotted")
end

Given (/^There is a spotted$/) do
    steps %Q{
        Given There is a college page created
    }

    u = Spotted.new(:content => "Spotted Teste", :user_id => @user.id, :college_id => @college.id)
    u.save

    @spotted = Spotted.find_by(content: "Spotted Teste")
end