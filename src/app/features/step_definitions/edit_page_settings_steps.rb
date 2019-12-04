Given(/^I am on the edit page settings page$/) do
    visit edit_college_path(@college, :id => @college.id)
end

When(/^I fill the edit page settings form$/) do
    steps %Q{
        Given I fill general info of college
    }
    fill_in "college[background_image]", with: ""
end

Then(/^I should see the green success toast$/) do
    expect(page).to have_xpath('.//div[@class="alert alert-success alert-dismissible"]')
end

When(/^I fill the edit page settings form including background_image field$/) do
    steps %Q{
        Given I fill general info of college
    }
end

When(/^I fill the edit page settings form except font_family field$/) do
    steps %Q{
        Given I fill general info of college
    }
    fill_in "college[font_family]", with: ""
end
  
Given (/^I fill general info of college$/) do
    fill_in "college[background_color]", with: "#fafafa"
    fill_in "college[background_image]", with: "https://townsquare.media/site/366/files/2019/04/Sabaton1.jpg?w=980&q=75"
    fill_in "college[font_family]", with: "Arial"
    fill_in "college[font_color]", with: "#000000"
    select 'Manual', from: "college[admin_approves_spotted]"
    select 'Sim', from: "college[request_to_participate]"
end