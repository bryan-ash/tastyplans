Feature: Ingredients

  Scenario: Empty Listing
    When I go to the ingredients page
    Then I should see "No ingredients available yet"
    And  I should not see "Ingredient"

  Scenario: Listing
    Given an ingredient named "Sugar"
    And   an ingredient named "Spice"
    When  I go to the ingredients page
    Then  "Spice" should be listed before "Sugar" on the ingredients page

  Scenario: Creating a new ingredient
    When I create an ingredient named "Sausage"
    Then I should see "Ingredient was successfully created."
    And  I should be on the ingredients page

  Scenario: Editing
    When  I rename "Choco" to "Chocolate"
    Then  I should see "Ingredient was successfully updated."
    And   I should see "Choco"

  Scenario: Name cannot be blank
    When I create an ingredient named ""
    Then I should see "can't be blank"
