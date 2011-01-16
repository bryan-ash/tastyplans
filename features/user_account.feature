Feature: User account

  Scenario: I can change my username
    Given I am signed in with username "John"
    When I change my username to "Johnny"
    Then I should see "Signed in as Johnny"
