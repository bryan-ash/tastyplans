Feature: Editing recipes

  Scenario: Change the name
    Given recipe "Recipe1" exists
    When I rename recipe "Recipe1" to "Recipe2"
    Then I should see "Your edits were saved"
    And I should see "Recipe2"

  Scenario: Edit disrections
    Given recipe "Fried Bacon" exists
    And   a "Fried Bacon" recipe has directions:
      """
      Fry the sausage.
      """
    And I am editing recipe "Fried Bacon"
    When I change the directions to:
      """
      Fry the bacon.
      """
    Then I should see "Fry the bacon"

  Scenario: Discard edits
    Given I am editing recipe "Recipe1"
    And  I fill in "name" with "Recipe2"
    When I follow "Discard edits"
    Then I should see "Recipe1"
