Feature: Recipe

  Background:
    Given I am a new, authenticated user
  
  Scenario: Accessible by a signed in user
    When I follow "List all recipes"
    Then I should see "Recipes"

  Scenario: Always available but requires sign in
    Given I am signed out
    When I follow "List all recipes"
    Then I should be on the sign in page

  Scenario: List all recipes in alphanumeric order
    Given recipe "Recipe2" exists
    And   recipe "Recipe1" exists
    Then  Recipe1 should be listed before Recipe2 on the Recipe Book page

  Scenario: Show a recipe
    Given a "Bacon Butty" recipe has ingredients:
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

  Scenario: Creating a simple recipe
    When I create a new recipe with 3 ingredients
    Then the 3 ingredient recipe should be shown

  Scenario: Change the name
    Given recipe "Recipe1" exists
    When I rename recipe "Recipe1" to "Recipe2"
    Then I should see "Thank you for editing that recipe"
    And I should see "Recipe2"

  Scenario: Edit description
    Given recipe "Lumps of Lard" exists
    And   a "Lumps of Lard" recipe has description:
      """
      Seriously, who doesn't love Lard!
      """
    And I am editing recipe "Lumps of Lard"
    When I change the description to:
      """
      An old family recipe.
      """
    Then I should see "An old family recipe"

  Scenario: Edit directions
    Given recipe "Fried Bacon" exists
    And   a "Fried Bacon" recipe has directions:
      """
      Fry the sausage.
      """
    And I am editing recipe "Fried Bacon"
    When I change the directions to:
      """
      Fry the bacon.
      """
    Then I should see "Fry the bacon"

  Scenario: Edit ingredients
    Given a "Bacon Butty" recipe has ingredients:
      | amount | unit  | ingredient |
      | 2      | slice | bread      |
      | 1/8    | stick | butter     |
      | 4      | slice | bacon      |
    And I am editing recipe "Bacon Butty"
    When I change the 2nd ingredient name to "Lard"
    Then I should see "Lard"

  Scenario: Discard edits
    Given I am editing recipe "Recipe1"
    And  I fill in "name" with "Recipe2"
    When I follow "Discard edits"
    Then I should see "Recipe1"

  Scenario: Markdown directions filter out HTML
    Given a "dangerous" recipe has directions:
      """
      <script>alert('hello')</script>
      """
    When I show the "dangerous" recipe
    Then I should see "<script>"
