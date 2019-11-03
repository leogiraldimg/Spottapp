Feature: Choose a administrator to a college page

As a administrator of a college page
I want to choose a user to be a administrator
So that i can distribute the page administration responsibility

Background:
Given I logged in successfully
And There is a college page created

Scenario: college page administrator defines a new user to be a administrator informing his nickname and clicking on the button "Adicionar"
    Given There is more than one user registered 
    And I am on the settings page of a college
    When I fill the nickname field to a new administrator
    And I click on the button Adicionar
    Then I should see the college settings page with a message informing that the action was a success