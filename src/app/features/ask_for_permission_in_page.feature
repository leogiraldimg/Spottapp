Feature: Ask permission to enter a private page

As a user
I want to be able to ask for permission to enter a private page
So I can see what kind of spotteds are in the page

Background: I am logged, there is a college created and I am at the favorite colleges menu page
    Given I am at the favorite college menu page
    And There is an another college page

Scenario: Apply for permission to the page
    Given I have entered the another college page
    And I haven't applied to the page
    Then I click the apply button
    And I should see the successful apply message

Scenario: I had my permission rejected to the page
    Given Someone have rejected my permission
    And I have entered the another college page
    Then I should see the rejected apply message

Scenario: I had my permission approved to the page
    Given Someone have approved my permission
    When I clicked to enter that college page
    Then I should see the college page