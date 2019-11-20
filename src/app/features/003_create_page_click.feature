Feature: Create a new page

As a spotted page manager
I want to create a page to my educational institution
So that I can manage the page of my educational institution

Background: I am logged in
    Given I logged in successfully

Scenario: spotted page manager clicks the create new page button with valid data and all fields filled except "background_image"
    Given I am on the create new page page
    When I fill the create new page form
    And I click the Cadastrar button
    Then I should see the initial user page