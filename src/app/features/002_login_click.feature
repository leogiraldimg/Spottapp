Feature: Login in the application

As a student 
I want to access the application with my account
So that I can send spotteds and follow the feed

Background: I have an account
    Given I have an account

Scenario: student clicks the login button
    Given I am on the login page
    When I fill the login form with login information
    And I click the Entrar button
    Then I should see the initial user page