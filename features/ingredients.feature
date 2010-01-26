Feature: Ingredients

  Scenario: Creating a new ingredient
    When I create an ingredient named "Sausage"
    Then I should see "Ingredient was successfully created."
    And  I should be on the ingredients page

  Scenario: Name cannot be blank
    When I create an ingredient named ""
    Then I should see "Ingredients have to be named"

  Scenario: Listing
    Given an ingredient named "Sugar"
    And   an ingredient named "Spice"
    When  I go to the ingredients page
    Then  Spice should be listed before Sugar on the ingredients page

  Scenario: Editing
    Given an ingredient named "Chocolate"
    When  I go to the ingredients page
    And   I follow "Chocolate"
    Then  I should see "Editing Ingredient"
    When  I fill in "Name" with "Choco"
    And   I press "Submit"
    Then  I should see "Ingredient was successfully updated."
    And   I should see "Choco"