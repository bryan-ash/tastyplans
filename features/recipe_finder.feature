Feature: Recipe Finder

  Background:
    Given I am a new, authenticated user

  Scenario: One ingredient found in one recipe
    Given a "Bacon Butty" recipe exists
    And   a "Chip Butty" recipe exists
    And   I am on the recipe finder page
    And   I fill in "recipe_finder_ingredient" with "bacon"

    When  I press "Find recipes"

    Then  I should see "bacon"
    And   I should see "Bacon Butty"
    And   I should not see "Chip Butty" within "article"

    When  I follow "Bacon Butty" within "article"
    Then  I should see "bread"
    
  Scenario: Finding using part of the ingredeint name
    Given a "Chocolate Surprise!" recipe has ingredients:
      | amount | unit   | ingredient        |
      | 2      | pounds | chocolate buttons |
    And a "Chocolate Delight!" recipe has ingredients:
      | amount | unit   | ingredient        |
      | 4      | bars   | plain chocolate   |
    And   I am on the recipe finder page
    And   I fill in "recipe_finder_ingredient" with "chocolate"

    When  I press "Find recipes"

    Then  I should see "Chocolate Surprise!"
    And   I should see "Chocolate Delight!"

  Scenario: A recipe with multiple ingredients that match is only shown once
    Given a "Chocolate Surprise!" recipe has ingredients:
      | amount | unit   | ingredient        |
      | 2      | pounds | chocolate buttons |
      | 4      | bars   | plain chocolate   |
    And   I am on the recipe finder page
    And   I fill in "recipe_finder_ingredient" with "chocolate"

    When  I press "Find recipes"

    Then  I should see "Chocolate Surprise!"
    And   I should see "1 recipe"

  Scenario: Removing ingredients
    Given recipe finder 42 has the following ingredients:
      | bacon |
    And   I am on the recipe finder 42 page

    When  I press "remove"

    Then I should not see "bacon"
