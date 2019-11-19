Feature: Manage college whitelist

As a page manager
I want to be able to manage the college whitelist
So I can manage its users permissions

Background: I am logged, I have a page and I am at the favorite colleges menu page
    Given I am at the favorite college menu page
    And Someone asked permission to enter the page
    Then I entered the management page

Scenario: I approve someone on the pending list
    Given There is someone on the pending list
    And I click to Approve it's permission
    Then It should appear in the approved list

Scenario: I reject someone on the pending list
    Given There is someone on the pending list
    And I click to Reject it's permission
    Then It should appear in the rejected list

Scenario: I revoke someone on the approved list
    Given Someone has been approved
    And I click to Revoke it's permission
    Then It should appear in the pending list

Scenario: I revoke someone on the rejected list
    Given Someone has been rejected
    And I click to Revoke it's permission
    Then It should appear in the pending list