Feature: Editing recipes

  Scenario: Change the name
    Given recipe "Recipe1" exists
    When I rename recipe "Recipe1" to "Recipe2"
    Then I should see "Your edits were saved"
    And I should see "Recipe2"

  Scenario: Discard edits
    Given I am editing recipe "Recipe1"
    And  I fill in "name" with "Recipe2"
    When I follow "Discard edits"
    Then I should see "Recipe1"
