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
