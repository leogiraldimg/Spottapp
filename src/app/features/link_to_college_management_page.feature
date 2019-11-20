# Feature: See the link to the management page

# As a page manager
# I want to see the link to the management page of the college page I have created
# So I can manage its users

# Background: I am logged, I have a page and I am at the favorite colleges menu page
#     Given There is a college page created
#     And I logged in successfully
#     Then I favorited that college
#     And I created a college page
#     And I go to favorite colleges menu page

# Scenario: Show the link to the management page if I am administrator of the page
#     Then I should see the link to the management page

# Scenario: Don't show the link to the management page if I'm not administrator of the page
#     Then I shouldn't see the link to the management page