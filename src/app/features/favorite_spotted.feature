Feature: Favorite a spotted

As a student
I want to favorite a spotted
So that I can receive notifications about the spotted

Background: I am logged in and there is a college page already created
    Given I logged in successfully
    And I created a college page
    And I accessed my college page successfully
    And I posted a spotted successfully on my college page

Scenario: student clicks on Ativar Notificações button
    Given I click on Ativar Notificações
    Then I should see the green success toast