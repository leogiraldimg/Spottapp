Feature: Favorite a college

    As a student
    I want to favorite a college
    So that the college appears on my favorite colleges menu

    Background: I am logged in
        Given I logged in successfully
        And I created a college page

    Scenario: Show a yellow star on colleges menu page when I favorite the college on colleges menu page
        Given I am on the colleges menu page
        When I click on the star icon
        Then The star icon must change to yellow

    Scenario: Show a college on favorite colleges menu page when I favorite the college on colleges menu page
        Given I am on the colleges menu page
        When I click on the star icon
        And I go to favorite colleges menu page
        Then I should see the college