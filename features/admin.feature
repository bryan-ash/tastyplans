Feature: Admin

  Background:
    Given I am signed in as an admin
  
  Scenario: Admin can view a list of users
    Given a user with Username "Jane", Email "Jane@Home.com"
    When I follow "List users"
    Then I should see "Jane"
    And  I should see "Jane@Home.com"

  Scenario: Only admins can view the user list
    Given I am a new, authenticated user
    Then I should not see "List users"

