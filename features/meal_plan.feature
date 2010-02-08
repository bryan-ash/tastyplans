Feature: Meal Plan

  Scenario: Show a meal plan
    Given the meal plan named "Next Week" includes the following meals:
      | day       | recipe          |
      | Monday    | Bacon Butty     |
      | Monday    | Ice Cream       |
      | Tuesay    | Chip Butty      |
      | Wednesday | PB & J          |
      | Thursday  | Chips and Gravy |
      
    When  I show the "Next Week" meal plan

    Then  I should see "Next Week"
    And   I should see "Monday" once
    And   I should see "Bacon Butty"
    And   I should see "Ice Cream"
    And   I should see "Chip Butty"
    And   I should see "PB & J"
    And   I should see "Chips and Gravy"

  Scenario: Creating
    Given a recipe exists
    When  I go to the new meal plan page
    Then  the plan should be named with next week's date
    And   I should see a suggested recipe for Monday
    And   I should see a suggested recipe for Tuesday
    And   I should see a suggested recipe for Wednesday
    And   I should see a suggested recipe for Thursday
    And   I should see a suggested recipe for Friday
    And   I should see a suggested recipe for Saturday
    And   I should see a suggested recipe for Sunday
