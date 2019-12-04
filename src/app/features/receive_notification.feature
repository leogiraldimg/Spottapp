Feature: Receive notification

As a student
I want to receive notifications from spotted
So that I can follow spotted updates

Scenario: Student clicks on bell button
    Given There is a comment created
    And I logged in successfully
    Given I accessed a college page successfully
    Given I click on Ativar Notificações
    And I click on bell button
    Then I should see my notifications

Scenario: Student clicks on bell button but has no notification 
    Given There is a spotted created
    And I logged in successfully
    And I am on the college page
    And I click on Ativar Notificações
    And I click on bell button
    Then I shouldnt see my notifications
