Feature: Editing recipes

  Scenario: Change the name
    Given recipe "Recipe1" exists
    When I rename recipe "Recipe1" to "Recipe2"
    Then I should see "Your edits were saved"

  Scenario: Discard edits
