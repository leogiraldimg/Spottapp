Feature: Receive notification

As a student
I want to receive notifications from spotted
So that I can follow spotted updates

Background: There is a spotted and a comment created
    Given There is a comment
    And I logged in successfully

Scenario: Student clicks on bell button
    Given I accessed a college page successfully
    Given I click on Ativar Notificações
    And I click on bell button
    Then I should see my notifications
