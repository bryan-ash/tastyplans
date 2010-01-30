Feature: Recipe

  Scenario: Show a recipe
    Given a recipe "Bacon Butty" with ingredients:
      | amount | unit  | ingredient |
      | 2      | slice | bread      |
      | 1/8    | stick | butter     |
      | 4      | slice | bacon      |
    When  show the "Bacon Butty" recipe
    Then  I should see "Bacon Butty"
    And   I should see "2 slice bread"
    And   I should see "1/8 stick butter"
    And   I should see "4 slice bacon"
