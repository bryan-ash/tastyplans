Feature: Meal Finder

  Scenario: One ingredient found in one recipe
    Given a "Bacon Butty" recipe exists
    And   I am on the meal finder page
    And   I fill in "ingredient" with "bacon"
    When  I press "Try This"
    Then  I should see "bacon"
    Then  I should see "Bacon Butty"
