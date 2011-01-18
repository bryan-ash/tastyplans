Feature: User account

  Scenario: I can change my username
    Given I am signed in with username "John"
    When I change my username to "Johnny"
    Then I should see "Signed in as Johnny"

  Scenario: I can change my email address
    Given I am signed in with email "John@home.com"
    When I change my email to "Johnny@home.com"
    And  I should see "Your account was successfully updated."
