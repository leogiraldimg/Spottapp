Feature: Sign up in the application

As a student 
I want to create an account
So that I can send spotteds and follow the feed

Scenario: student clicks the login button with valid data and all fields filled
    Given I am on the create account page
    When I fill the user registration form
    And I click the Cadastrar button
    Then I should see the welcome page