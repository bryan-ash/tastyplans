Feature: Editing recipes

  Background:
    Given I am a new, authenticated user
  
  Scenario: Change the name
    Given recipe "Recipe1" exists
    When I rename recipe "Recipe1" to "Recipe2"
    Then I should see "Thank you for editing that recipe"
    And I should see "Recipe2"

  Scenario: Edit directions
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

  Scenario: Edit ingredients
    Given a "Bacon Butty" recipe has ingredients:
      | amount | unit  | ingredient |
      | 2      | slice | bread      |
      | 1/8    | stick | butter     |
      | 4      | slice | bacon      |
    And I am editing recipe "Bacon Butty"
    When I change the 2nd ingredient name to "Lard"
    Then I should see "Lard"

  Scenario: Discard edits
    Given I am editing recipe "Recipe1"
    And  I fill in "name" with "Recipe2"
    When I follow "Discard edits"
    Then I should see "Recipe1"
