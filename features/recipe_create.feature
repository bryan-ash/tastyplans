Feature: Creating recipes

  Scenario: Creating a simple recipe
    Given I am a new, authenticated user
    When I create a new recipe with 3 ingredients
    Then the 3 ingredient recipe should be shown
