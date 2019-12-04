Given /^I am on the create new page page$/ do
    visit new_college_path
end

When /^I fill the create new page form$/ do
    steps %Q{
        When I fill in "college_name" with "Universidade Teste 001"
        When I fill in "college_initials" with "UT001"
        When I fill in "college_city" with "São Paulo"
        When I fill in "college_state" with "SP"
        When I fill in "college_country" with "Brasil"
        When I fill in "college_unit" with "Faculdade Teste 001"
        When I fill in "college_background_color" with "#fafafa"
        When I fill in "college_font_family" with "Arial"
        When I fill in "college_font_color" with "#000000"
    }
end

When /^I select manual approve$/ do
    select 'Manual', from: "college[admin_approves_spotted]"
end

When /^I select to not request to participate$/ do
    select 'Não', from: "college[request_to_participate]"
end

# - - -

Given /^There is a college page created$/ do
    steps %Q{
        Given There is an unregistered user
    }
    u = College.new(:name => "Universidade Teste 002",
        :initials => "UT002",
        :city => "São Paulo",
        :state => "SP",
        :country => "Brasil",
        :unit => "Faculdade Teste 002",
        :user_id => @user.id,
        :background_color => "fafafa",
        :font_family => "Arial",
        :background_image => "",
        :font_color => "#000000",
        :request_to_participate => 0)
    u.save

    @college = College.find_by(initials: "UT002")
end

Given /^I created a college page$/ do
    steps %Q{
        Given I am on the create new page page
        When I fill the create new page form
        And I click the Cadastrar button
        Then I should see the initial user page
    }
    @college = College.find_by(initials: "UT001")
    
end

Given /^There is a college page with request needed created$/ do
    steps %Q{
        Given There is another unregistered user
    }
    u = College.new(:name => "Universidade Teste 003",
        :initials => "UT003",
        :city => "São Paulo",
        :state => "SP",
        :country => "Brasil",
        :unit => "Faculdade Teste 003",
        :user_id => @user.id,
        :background_color => "fafafa",
        :font_family => "Arial",
        :background_image => "",
        :font_color => "#000000",
        :request_to_participate => 1)
    u.save

    @college = College.find_by(initials: "UT003")
end