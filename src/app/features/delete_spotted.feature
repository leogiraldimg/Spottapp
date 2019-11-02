Feature: Delete spotted

As a page manager 
I want to delete spotted
So that I can control the college page posts

Background: I am logged in and there is a college page already created
    Given I logged in successfully
    And There is a college page created
    And I accessed a college page successfully
    And I posted a spotted successfully

Scenario: page manager clicks on trash button
    Given I click on trash button
    Then I should see the green success toast