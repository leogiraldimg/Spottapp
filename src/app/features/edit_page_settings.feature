Feature: Edit page settings

As a spotted page manager
I want to edit the page settings
So that I can manage the page of my educational institution

Background: I am logged in
    Given I logged in successfully

Scenario: spotted page manager clicks the update page settings button with valid data and all fields filled except "background_image"
    Given There is an registered user
    And There is a page created by me
    And I am on the edit page settings page
    When I fill the edit page settings form
    And I click the Atualizar Edição de Página button
    Then I should see the green success toast

Scenario: spotted page manager clicks the update page settings button with valid data and all fields filled
    Given There is an registered user
    And There is a page created by me
    And I am on the edit page settings page
    When I fill the edit page settings form including background_image field
    And I click the Atualizar Edição de Página button
    Then I should see the green success toast

Scenario: spotted page manager clicks the update page settings button with valid data and all fields filled except "font_family"
    Given There is an registered user
    And There is a page created by me
    And I am on the edit page settings page
    When I fill the edit page settings form except font_family field
    And I click the Atualizar Edição de Página button
    Then I should see the green success toast