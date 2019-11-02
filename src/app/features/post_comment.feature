Feature: Post a comment at a spotted

As a student
I want to post a comment
So that I can tell what I think about any spotted

Background:
    Given There is a college page created
    And I logged in successfully
    And I accessed a college page successfully
    And I posted a spotted successfully on the college page

Scenario: student write a comment on the content field and clicks the button "Mandar Comentário"
    Given I am on the view spotted page
    When I fill the content comment field with some information
    And I click the Mandar comentário button
    Then I should see the view spotted page
    And I should see my new comment on the timeline