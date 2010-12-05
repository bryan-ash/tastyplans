Feature: Recipe

  Scenario: Show a recipe
    Given I am a new, authenticated user
    And a "Bacon Butty" recipe has ingredients:
      | amount | unit  | ingredient |
      | 2      | slice | bread      |
      | 1/8    | stick | butter     |
      | 4      | slice | bacon      |
    And a "Bacon Butty" recipe has directions:
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

  Scenario: List all recipes in alphanumeric order
    Given recipe "Recipe2" exists
    And   recipe "Recipe1" exists
    Then  Recipe1 should be listed before Recipe2 on the recipes page

  Scenario: Markdown directions filter out HTML
    Given I am a new, authenticated user
    And a "dangerous" recipe has directions:
      """
      <script>alert('hello')</script>
      """
    When I show the "dangerous" recipe
    Then I should see "<script>"
