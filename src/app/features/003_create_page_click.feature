Feature: Create a new page

As a user
I want to create a page to my educational institution
So that there is a page to my educational institution on the app

Background: I am logged in
    Given I logged in successfully

Scenario: User clicks the create new page button with valid data
    Given I am on the create new page page
    When I fill the create new page form
    And I select manual approve
    And I select to not request to participate
    And I click the Cadastrar button
    Then I should see the initial user page

Scenario Outline: User clicks the create new page button with invalid data
    Given I am on the create new page page
    When I fill the create new page form
    And I fill in "<form field>" with "<value>"
    And I select manual approve
    And I select to not request to participate
    And I click the Cadastrar button
    Then I should see the red failed toast

    Examples:
    | form field | value |
    | college_name | |
    | college_initials | nove letras |
    | college_city | |
    | college_state | |
    | college_state | São Paulo |
    | college_country | |
    | college_font_color | |
    | college_background_color | |