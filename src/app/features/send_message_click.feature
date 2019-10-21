Feature: Send a message to app owners

As a student or page manager
So that I can report a problem or ask a question
I want to send a message to app owners

Scenario: student or page manager clicks the Send Message button with valid data and all fields filled
    Given I am on the Contact page
    When I fill the Contact form
    And I click the Enviar Mensagem button
    Then I should see the green success toast