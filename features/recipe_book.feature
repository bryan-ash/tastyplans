Feature: Recipe Book

  This is just a list of recipes

  Scenario: Accessible by a signed in user
    Given I am a new, authenticated user
    When I follow "Recipe Book"
    Then I should see "Recipes"
