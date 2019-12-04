Feature: Sign up in the application

As a user 
I want to create an account
So that I can use the application

Scenario: User creates a new account filling all fields with valid data
    Given I am on the create account page
    When I fill the user registration form
    When I attach a profile picture
    And I click the Cadastrar button
    Then I should see the welcome page

Scenario: User creates a new account successfully and check the option to see near colleges
    Given I am on the create account page
    When I fill the user registration form
    When I attach a profile picture
    And I check the checkbox to see the page's wizard
    And I click the Cadastrar button
    Then I should see the page's wizard

Scenario Outline: User try to create a new account with invalid data
    Given I am on the create account page
    When I fill the user registration form 
    When I fill in "<form field>" with "<value>"
    When I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast

    Examples:
    | form field | value |
    | user_email | emailinvalido.com |
    | user_password_confirmation | senha errada |

Scenario: User try to create a new account with invalid password format
    Given I am on the create account page
    When I fill the user registration form 
    When I fill in "user_password" with "cinco"
    When I fill in "user_password_confirmation" with "cinco"
    When I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast

Scenario: User try to create a new account with existing user nickname
    Given There is an unregistered user
    And I am on the create account page
    When I fill the user registration form
    When I fill in "user_nickname" with "teste002.user"
    When I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast