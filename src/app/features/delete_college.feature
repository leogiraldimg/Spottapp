Feature: Delete college page

As a spotted page manager
I want to delete the college page
So that the college does not have a page anymore

Background: I am logged in and there is a college page created
    Given I logged in successfully
    And I created a college page

Scenario: Delete a college page when I go to edit page settings and click the "Apagar a página" button
    Given I am on the edit page settings page
    When I click the Apagar a página button
    And I am on the colleges menu page
    Then The college page shouldn't be exist anymore

Scenario: User tries to delete a college that he is not admin
    Given There is a college page created
    And I am on the colleges menu
    Then I cant find that college Editar button