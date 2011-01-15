Feature: Demo

  Background:
    Given demo mode is active

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

  Scenario: A demo user cannot add a recipe to meal plan
    Given I am viewing the "Demo" recipe
    When I press "Add to Meal Plan"
    Then I should see "Sign up if you'd like to create and edit meal plans"
  
  Scenario: A demo user cannot remove a recipe from meal plan
    Given I have a meal plan named "Demo Plan" with the following meals:
      | recipe  |
      | pudding |
    When I go to the edit meal plan "Demo Plan" page
    And I press "remove"
    Then I should see "Sign up if you'd like to create and edit meal plans"

  Scenario: The demo user's account cannot be edited
    When I go to the edit user page
    Then I should be on the home page
