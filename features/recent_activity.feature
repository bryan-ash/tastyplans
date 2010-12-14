Feature: Recent Activity

  Scenario: Last 5 recipes created are visible
    Given recipe "New Recipe1" exists
    Given recipe "New Recipe2" exists
    Given recipe "New Recipe3" exists
    Given recipe "New Recipe4" exists
    Given recipe "New Recipe5" exists
    Given recipe "New Recipe6" exists

    When I go to the home page

    Then I should see "New Recipe2"
    Then I should see "New Recipe3"
    Then I should see "New Recipe4"
    Then I should see "New Recipe5"
    Then I should see "New Recipe6"
    Then I should not see "New Recipe1"

  Scenario: Last 5 recipes edited are visible
    Given I am a new, authenticated user
    Given recipe "New Recipe1" exists
    Given recipe "New Recipe2" exists
    Given recipe "New Recipe3" exists
    Given recipe "New Recipe4" exists
    Given recipe "New Recipe5" exists
    Given recipe "New Recipe6" exists

    When I rename recipe "New Recipe1" to "Edited Recipe1"
    When I go to the home page

    Then I should see "Edited Recipe1"
