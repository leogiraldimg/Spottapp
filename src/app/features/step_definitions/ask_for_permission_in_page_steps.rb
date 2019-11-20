And (/^Someone asked permission to enter the page$/) do
    c = College.find_by(initials: "UT003")
    u = User.find_by(nickname: "teste001.user")
    cw = CollegeWhitelist.new(college: c, user: u, status: "pending")
    cw.save

    cw = CollegeWhitelist.find_by(college_id: c.id, user_id: u.id)
end

And (/^There is an another college page$/) do
    expect(page).to have_xpath("//*[text()[contains(.,'UT003 - Faculdade Teste 003')]]")
end

Given (/^I clicked to enter that college page$/) do
    page.find(:xpath, "//*[text()[contains(.,'UT003 - Faculdade Teste 003')]]/../..//div[@class='college-btn']/a").click
end

Then (/^I should see the page to apply$/) do
    expect(page).to have_xpath(".//h2", text: "Pedir permissão de entrada")
end

Given (/^I have entered the another college page$/) do
    steps %Q{
        Given I clicked to enter that college page
        Then I should see the page to apply
    }
end

And (/^I haven't applied to the page$/) do
    expect(page).to have_xpath(".//div[@class='actions']/input[@class='botao']")
end

Then (/^I click the apply button$/) do
    click_button('Pedir permissão')
end

And (/^I should see the successful apply message$/) do
    expect(page).to have_xpath(".//p", text: "Sua permissão de entrada está pendente.Aguarde.")
end

Given (/^Someone have rejected my permission$/) do
    c = College.find_by(initials: "UT003")
    u = User.find_by(nickname: "teste001.user")
    cw = CollegeWhitelist.new(college: c, user: u, status: "rejected")
    cw.save

    cw = CollegeWhitelist.find_by(college_id: c.id, user_id: u.id)
end

Then (/^I should see the rejected apply message$/) do
    expect(page).to have_xpath(".//p", text: 'Sua permissão foi rejeitada pela administração.')
end

Given (/^Someone have approved my permission$/) do
    c = College.find_by(initials: "UT003")
    u = User.find_by(nickname: "teste001.user")
    cw = CollegeWhitelist.new(college: c, user: u, status: "approved")
    cw.save

    cw = CollegeWhitelist.find_by(college_id: c.id, user_id: u.id)
end

