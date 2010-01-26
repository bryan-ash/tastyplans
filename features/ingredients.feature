Feature: Ingredients

  Scenario: Listing
    Given an ingredient named "Sugar"
    And   an ingredient named "Spice"
    When  I go to the ingredients page
    Then  Spice should be listed before Sugar on the ingredients page

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

  Scenario: Names must be unique
    Given an ingredient named "Chocolate"
    When  I create an ingredient named "Chocolate"
    Then  I should see "has already been taken"

  Scenario: Name uniqueness is checked when editing
    Given an ingredient named "Chocolate"
    When  I rename "Pudding" to "Chocolate"
    Then  I should see "has already been taken"