@javascript
Feature: Access a college page

As a student 
I want to access a college page
So that I can check spotteds and content of that page

Background: I am logged in and there is a college page already created
    Given I logged in successfully
    And I created a college page

Scenario: student clicks on a college link at the colleges menu and access the college page
    Given I am on the colleges menu
    When I click on my college page link
    Then I should see my college page
