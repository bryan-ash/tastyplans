Feature: Demo

  Background:
    Given I am signed out

  Scenario: Demo mode is active when user is signed out
    Then I should see "Demo mode active"
    And  I should see "Sign in"

  Scenario: A demo user cannot create a new recipe
    Given I am on the new recipe page
    When I press "Save new recipe"
    Then I should see "Sign up if you'd like to create and edit recipes"

  Scenario: A demo user cannot save an edited recipe
    Given I am editing recipe "Recipe1"
    When I press "Save your edits"
    Then I should see "Sign up if you'd like to create and edit recipes"

  Scenario: A demo user cannot save a new meal plan
    Given I am on the start new meal plan page
    When I press "Save this meal plan"
    Then I should see "Sign up if you'd like to create and edit meal plans"

  Scenario: A demo user cannot save an edited new meal plan
    Given I have a meal plan named "Demo Plan" with the following meals:
      | recipe  |
      | pudding |
    When I go to the edit meal plan "Demo Plan" page
    And  I press "Save this meal plan"
    Then I should see "Sign up if you'd like to create and edit meal plans"

