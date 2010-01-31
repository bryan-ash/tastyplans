Feature: Recipe

  Scenario: Show a recipe
    Given a "Bacon Butty" recipe has ingredients:
      | amount | unit  | ingredient |
      | 2      | slice | bread      |
      | 1/8    | stick | butter     |
      | 4      | slice | bacon      |
    And   a "Bacon Butty" recipe has directions:
      """
      Fry the bacon.
      Butter the bread.
      Put the bacon between the buttered bread.
      """

    When  I show the "Bacon Butty" recipe

    Then  I should see "Bacon Butty"
    And   I should see "2 slice bread"
    And   I should see "1/8 stick butter"
    And   I should see "4 slice bacon"
    And   I should see "Fry the bacon"
