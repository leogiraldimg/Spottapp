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
    | user_first_name | |
    | user_last_name | |
    | user_nickname | |
    | user_birth_date | |
    | user_email | |
    | user_email | emailinvalido.com |
    | user_email | emailinvalido@empresa |
    | user_password | |
    | user_password_confirmation | |
    | user_password_confirmation | confirmacao errada |
    | user_country | |
    | user_state | |
    | user_state | São Paulo |
    | user_city | |

Scenario: User try to create a new account with invalid password format
    Given I am on the create account page
    When I fill the user registration form 
    When I fill in "user_password" with "cinco"
    And I fill in "user_password_confirmation" with "cinco"
    And I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast

Scenario: User try to create a new account with existing user nickname
    Given There is an unregistered user
    And I am on the create account page
    When I fill the user registration form
    And I fill in "user_nickname" with "teste002.user"
    And I attach a profile picture
    And I click the Cadastrar button
    Then I should see the red failed toast