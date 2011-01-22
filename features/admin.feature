Feature: Admin

  Scenario: Admin can view a list of users
    Given an admin with Username "Admin"
    When I sign in with "Admin"
    When I follow "List users"
    Then I should see "User List"

  Scenario: Only admins can view the user list
    Given I am a new, authenticated user
    Then I should not see "List users"
