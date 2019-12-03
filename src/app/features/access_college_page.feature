Feature: Access a college page

As a student 
I want to access a college page
So that I can check spotteds and content of that page

Background: I am logged in
    Given I logged in successfully
    
Scenario: student clicks on a college link at the colleges menu and access the college page
    Given I created a college page
    And I am on the colleges menu
    When I click on my college page link
    Then I should see my college page

Scenario: student is on college page but there is no college
    Given I am on the colleges menu
    Then I should see empty college page menu
