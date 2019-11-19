@javascript
Feature: Delete comment

As a student
I want to delete comment
So that I can control my comments

Background: I am logged in and there is a college page and a comment already created
    Given I logged in successfully
    And I created a college page
    And I accessed my college page successfully
    And I posted a spotted successfully on my college page
    And I posted a comment successfully

Scenario: student clicks on trash button
    Given I click on trash button
    Then I should see the green success toast