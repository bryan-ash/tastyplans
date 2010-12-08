Feature: Recipe Book

  This is just a list of recipes

  Scenario: Accessible by a signed in user
    Given I am a new, authenticated user
    When I follow "Recipe Book"
    Then I should see "Recipes"

  Scenario: Always available but requires sign in
    Given I am signed out
    When I follow "Recipe Book"
    Then I should be on the sign in page

  Scenario: List all recipes in alphanumeric order
    Given recipe "Recipe2" exists
    And   recipe "Recipe1" exists
    Then  Recipe1 should be listed before Recipe2 on the Recipe Book page
