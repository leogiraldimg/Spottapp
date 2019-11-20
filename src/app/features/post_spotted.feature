Feature: Post a spotted at a college page

As a student
I want to post a spotted
So that I can tell anonymously what I think about someone

Background:
    Given There is a college page created
    And I logged in successfully
    And I accessed a college page successfully

Scenario: student write a spotted on the content field and clicks the button "Mandar Spotted"
    Given I click the Novo spotted button
    When I fill the content spotted field with some information
    And I click the Mandar spotted button
    Then I should see the college page
    And I should see my new spotted on the timeline