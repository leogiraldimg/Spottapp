And (/^Someone asked permission to enter the page$/) do
    c = College.find_by(initials: "UT001")
    u = User.find_by(nickname: "teste001.user")
    cw = CollegeWhitelist.new(college: c, user: u, status: "pending")
    cw.save

    cw = CollegeWhitelist.find_by(college_id: c.id, user_id: u.id)
end

And (/^There is an another college page$/) do
    expect(page).to have_xpath(".//a", text: "UT002 - Faculdade Teste 002")
end

Given (/^I clicked to enter that college page$/) do
    click_link('UT002 - Faculdade Teste 002')
end

Then (/^I should see the page to apply$/) do
    expect(page).to have_xpath(".//h1", text: "Pedir permissão de entrada")
end

Given (/^I have entered the another college page$/) do
    steps %Q{
        Given I clicked to enter that college page
        Then I should see the page to apply
    }
end

And (/^I haven't applied to the page$/) do
    expect(page).to have_xpath(".//div[@class='actions']/input[@class='btn btn-primary']")
end

Then (/^I click the apply button$/) do
    click_button('Pedir permissão')
end

And (/^I should see the successful apply message$/) do
    expect(page).to have_xpath(".//h3", text: "Sua permissão de entrada está pendente. Aguarde.")
end

Given (/^Someone have rejected my permission$/) do
    c = College.find_by(initials: "UT002")
    u = User.find_by(nickname: "teste001.user")
    cw = CollegeWhitelist.new(college: c, user: u, status: "rejected")
    cw.save

    cw = CollegeWhitelist.find_by(college_id: c.id, user_id: u.id)
end

Then (/^I should see the rejected apply message$/) do
    expect(page).to have_xpath(".//h3", text: 'Sua permissão foi rejeitada pela administração.')
end

Given (/^Someone have approved my permission$/) do
    c = College.find_by(initials: "UT002")
    u = User.find_by(nickname: "teste001.user")
    cw = CollegeWhitelist.new(college: c, user: u, status: "approved")
    cw.save

    cw = CollegeWhitelist.find_by(college_id: c.id, user_id: u.id)
end

