Feature: Sign up in the application

As a student 
I want to create an account
So that I can send spotteds and follow the feed

Scenario: student clicks the register button with valid data and all fields filled
    Given I am on the create account page
    When I fill the user registration form
    And I click the Cadastrar button
    Then I should see the welcome page

Scenario: student check the page's wizard checkbox and clicks the register button with data and all fields filled
    Given I am on the create account page
    When I fill the user registration form
    And I check the checkbox to see the page's wizard
    And I click the Cadastrar button
    Then I should see the page's wizard

Scenario: student clicks the register button with valid data and all fields filled including profile picture
    Given I am on the create account page
    When I fill the user registration form including the profile picture
    And I click the Cadastrar button
    Then I should see the welcome page