Feature: Meal Plan

  Scenario: Show a meal plan
    Given the meal plan named "Next Week" includes the following meals:
      | recipe          |
      | Bacon Butty     |
      | Ice Cream       |
      | Chip Butty      |
      | PB & J          |
      | Chips and Gravy |
      
    When  I show the "Next Week" meal plan

    Then  I should see "Next Week"
    And   I should see "Bacon Butty"
    And   I should see "Ice Cream"
    And   I should see "Chip Butty"
    And   I should see "PB & J"
    And   I should see "Chips and Gravy"

  Scenario: Starting a new plan
    When  I go to the new meal plan page
    Then  the plan should be named with next week's date

