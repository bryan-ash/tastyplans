Feature: Demo

  Background:
    Given I am signed out

  Scenario: Demo mode is active when user is signed out
    Then I should see "Demo mode active"
    And  I should see "Sign in"

  Scenario: A demo user cannot create a new recipe
    When I am on the new recipe page
    When I press "Save new recipe"
    Then I should see "Sign up if you'd like to create and edit recipes"
