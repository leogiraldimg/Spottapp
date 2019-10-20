Feature: Access a college page

As a student 
I want to access a college page
So that I can check spotteds and content of that page

Background: I am logged in and there is a college page already created
    Given I logged in successfully
    And There is a college page created

Scenario: student clicks on a college link at the colleges menu and access the college page
    Given I am on the colleges menu
    When I click on a link to college
    Then I should see the college page
