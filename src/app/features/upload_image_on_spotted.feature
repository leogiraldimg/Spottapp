Feature: Post a spotted with an image

As a student
I want to post a spotted with an image
So that the image appears on the spotted I posted on spotted page

Background: I am logged in and there is a college page created
    Given There is a college page created
    And I logged in successfully
    And I accessed a college page successfully

Scenario: Post a spotted with an image when I create a new spotted and upload an image
    Given I am on the new spotted page
    When I fill the content spotted field with some information
    And I upload an image to the spotted
    And I click the Mandar spotted button
    And I go to spotted page 
    Then I should see my new spotted on the timeline
    And I should my see my image attached