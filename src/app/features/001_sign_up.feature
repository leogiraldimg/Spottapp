Feature: Sign up in the application

As a user 
I want to create an account
So that I can use the application

Scenario: User creates a new account filling all fields filled with valid data
    Given I am on the create account page
    When I fill the user registration form
    And I click the Cadastrar button
    Then I should see the welcome page

Scenario: User creates a new account successfully checking the checkbox to see near colleges
    Given I am on the create account page
    When I fill the user registration form
    And I check the checkbox to see the page's wizard
    And I click the Cadastrar button
    Then I should see the page's wizard