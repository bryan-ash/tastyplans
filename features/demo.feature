Feature: Demo

  Scenario: Demo mode is active when user is signed out
    Given I am signed out
    Then I should see "Demo mode active"
    And  I should see "Sign in"