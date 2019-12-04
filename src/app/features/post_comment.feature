Feature: Post a comment at a spotted

As a student
I want to post a comment
So that I can tell what I think about any spotted

Background:
    Given There is a spotted created
    And I logged in successfully

Scenario: student write a comment on the content field and clicks the button "Mandar Comentário"
    Given I am on the college page
    When I click the Ver spotted button
    And I fill the content comment field with some information
    And I click the Mandar comentário button icon
    Then I should see the view spotted page
    And I should see my new comment on the timeline