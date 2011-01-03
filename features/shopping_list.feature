Feature: Shopping List

  Background:
    Given I am a new, authenticated user

  Scenario: Contains ingredients for the meal plan
    Given recipe "One Ingredient" is in my current meal plan
    And a "One Ingredient" recipe has ingredients:
      | ingredient |
      | only       |
    When I follow "My current plan"
    And I follow "Shopping list"
    Then I should see "only"
