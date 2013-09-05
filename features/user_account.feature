Feature: User account

  Scenario: I can change my username
    Given I am signed in with username "John"
    When I change my username to "Johnny"
    Then I should see "Signed in as Johnny"

  Scenario: I can change my email address
    Given I am signed in with email "John@home.com"
    When I change my email to "Johnny@home.com"
    Then I should see "Your account was successfully updated."

  Scenario: I can change my password
    Given I am signed in with username "John" and password "secret"
    When I change my password from "secret" to "double secret"
    Then I should see "Your account was successfully updated."

  Scenario: New password and confirmation must match
    Given I am signed in with username "John" and password "secret"
    When I update my account with a new password and confirmation that don't match, using password "secret"
    Then I should see "Password confirmation doesn't match"

  Scenario: Editing is accessible
    Given I am signed in with username "John"
    When I follow "Edit account"
    Then I should be on the edit user page
