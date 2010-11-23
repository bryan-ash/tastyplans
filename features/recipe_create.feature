Feature: Creating recipes

  Scenario: Creating a simple recipe
    When I create a new recipe
    Then the new recipe should be shown
