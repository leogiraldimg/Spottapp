Feature: Favorite a college

As a student
I want to update my user data
So that I can change my profile information

Background: I am logged in
    And I logged in successfully

Scenario: Update my user data information
    Given I am on the edit user page
    When I fill the username with a new username information
    And I fill the passwords fields
    And I click the Save button
    Then I should see the green success toast