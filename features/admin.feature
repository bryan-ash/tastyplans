Feature: Admin

  Background:
    Given I am signed in as an admin
  
  Scenario: Admin can view a list of users
    Given a user with Username "Jane", Email "Jane@Home.com"
    When I follow "List users"
    Then I should see "Jane"
    And  I should see "Jane@Home.com"

  Scenario: The demo user is not shown in the list
    Given I am signed out
    Given I am signed in as an admin
    When I follow "List users"
    And  I should not see "Demo User"

  Scenario: Admin can add new users
    When I follow "Add a new user"
    And I fill in "Username" with "Annie"
    And I fill in "Email" with "annie.oakley@gmail.com"
    And I fill in "Password" with "gottagun"
    And I fill in "Password confirmation" with "gottagun"
    And I press "Create user"
    Then I should see "Annie"

  Scenario: Admin can remove users
    Given a user with Username "Jennifer"
    When I go to the list users page
    Then "Jennifer" should be the 2nd user listed

    When I remove the 2nd user
    Then I should not see "Jennifer" within "article"

  Scenario: Only admins can view the user list
    Given I am a new, authenticated user
    Then I should not see "List users"

    When I go to the list users page
    Then I should be on the home page
