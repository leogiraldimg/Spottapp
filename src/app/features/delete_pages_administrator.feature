Feature: Delete a page's administrator

As a administrator of a college page
I want to delete a administrator of the page
So that i can manage the page administration resposibility

Background:
Given I logged in successfully
And I created a college page
And I already defined the user as administrator

Scenario: Administrator choose othe administrator to be exclude clicking on the trash buttom
Given I am on the page's list of administrators
When I click on the trash button associated with a administrator
Then I should see the list without the administrator that I choose
And I should see a success message

