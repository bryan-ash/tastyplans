Feature: Meal Plan

  Background:
    Given I am a new, authenticated user

  Scenario: A logged in user can start a new plan
    When I follow "Start a new plan"
    Then the plan should be named with this week's date

  Scenario: A logged out user cannot start a new plan
    Given I am signed out
    When  I follow "Start a new plan"
    Then  I should be on the sign in page

  Scenario: Only my plans are listed
    Given "another" user has a meal plan
    When I go to my meal plans page
    Then I should not see "another" user's plans

  Scenario: Plan name is editable
    When I follow "Start a new plan"
    When I fill in "Give this meal plan a name" with "Next Week"
    And  I press "Save this meal plan"
    And  I go to my meal plans page
    Then I should see "Next Week"

  Scenario: Show a meal plan
    Given the meal plan named "Next Week" includes the following meals:
      | recipe          |
      | Bacon Butty     |
      | Ice Cream       |
      
    When I show the "Next Week" meal plan

    Then I should see "Next Week"
    And  I should see "Bacon Butty"
    And  I should see "Ice Cream"
