Feature: Sign up in the application

As a user 
I want to create an account
So that I can use the application

Scenario: User creates a new account filling all fields with valid data
    Given I am on the create account page
    When I fill the user registration form
    And I attach a profile picture
    And I click the Cadastrar button
    Then I should see the welcome page

Scenario: User creates a new account successfully and check the option to see near colleges
    Given I am on the create account page
    When I fill the user registration form
    And I attach a profile picture
    And I check the checkbox to see the page's wizard
    And I click the Cadastrar button
    Then I should see the page's wizard

Scenario Outline: User try to create a new account with invalid data
    Given I am on the create account page
    When I fill the user registration form 
    And I fill in "<form field>" with "<value>"
    And I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast

    Examples:
    | form field | value |
    | user first name | |
    | user last name | |
    | user nickname | |
    | user birth date | |
    | user email | |
    | user email | emailinvalido.com |
    | user email | emailinvalido@empresa |
    | user password | |
    | user password confirmation | |
    | user password confirmation | confirmacao errada |
    | user country | |
    | user state | |
    | user state | São Paulo |
    | user city | |

Scenario: User try to create a new account with invalid password format
    Given I am on the create account page
    When I fill the user registration form 
    When I fill in "user password" with "cinco"
    And I fill in "user password confirmation" with "cinco"
    And I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast

Scenario: User try to create a new account with existing user nickname
    Given There is an unregistered user
    And I am on the create account page
    When I fill the user registration form
    And I fill in "user nickname" with "teste002.user"
    And I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast