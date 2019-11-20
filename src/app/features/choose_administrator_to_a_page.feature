Feature: Choose a administrator to a college page

As a administrator of a college page
I want to choose a user to be a administrator
So that i can distribute the page administration responsibility

Background:
Given I logged in successfully
And I created a college page

Scenario: college page administrator defines a new user to be a administrator informing his nickname and clicking on the button "Adicionar"
    Given There is more than one user registered 
    And I am on the settings page of a college
    When I fill the nickname field to a new administrator
    And I click the Adicionar button
    Then I should see the college settings page with a message informing that the action was a success

Scenario: college page administrator defines a new user to be a administrator informing his nickname but the user is not found
    Given There is more than one user registered 
    And I am on the settings page of a college
    When I fill the user's nickname field to a new administrator, but this nickname do not exist 
    And I click the Adicionar button
    Then I should see the college settings page with a message informing that the user was not found

Scenario: college page administrator defines a new user to be a administrator informing his nickname but the user is the owner of the page
    Given There is more than one user registered 
    And I am on the settings page of a college
    When I fill the user's nickname field to a new administrator, but this user is the owner of the page
    And I click the Adicionar button
    Then I should see the college settings page with a message informing that the user is already owner page and administrator

Scenario: college page administrator defines a new user to be a administrator informing his nickname but the user is already a administrator
    Given I already defined the user as administrator
    And I am on the settings page of a college
    When I fill the nickname field to a new administrator
    And I click the Adicionar button
    Then I should see the college settings page with a message informing that the user is already a administrator