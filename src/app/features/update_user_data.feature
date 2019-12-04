Feature: Favorite a college

As a student
I want to update my user data
So that I can change my profile information

Background: I am logged in
    Given There is an unregistered user
    And I logged in successfully

Scenario: Update my user data information
    Given I am on the edit user page
    When I fill the username with a new username information
    And I fill the passwords fields
    And I click the Salvar button
    Then I should see the green success toast

Scenario: User tries to update user name with existing user name
    Given I am on the edit user page
    And I fill in "user nickname" with "teste002.user"
    And I fill the passwords fields
    And I click the Salvar button
    Then I should see the red failed toast