Feature: User account

  Scenario: I can change my username
    Given a user with Username "John"
    And I sign in with "John"
    When I go to the edit user page
    And I fill in "Please choose a user name" with "Johnny"
    And I fill in "Enter your current password to confirm changes" with "password"
    And I press "Save user account changes"
    Then show me the page
    Then I should see "Signed in as Johnny"
