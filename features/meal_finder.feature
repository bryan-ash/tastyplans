Feature: Meal Finder

  Scenario: One ingredient found in one recipe
    Given a "Bacon Butty" recipe exists
    And   a "Chip Butty" recipe exists
    And   I am on the meal finder page
    And   I fill in "ingredient" with "bacon"

    When  I press "Find recipes"

    Then  I should see "bacon"
    And   I should see "Bacon Butty"
    And   I should not see "Chip Butty"

    When  I follow "Bacon Butty"
    Then  I should see "bread"
    
  Scenario: Finding using part of the ingredeint name
    Given a "Chocolate Surprise!" recipe has ingredients:
      | amount | unit   | ingredient        |
      | 2      | pounds | chocolate buttons |
    And a "Chocolate Delight!" recipe has ingredients:
      | amount | unit   | ingredient        |
      | 4      | bars   | plain chocolate   |
    And   I am on the meal finder page
    And   I fill in "ingredient" with "chocolate"

    When  I press "Find recipes"

    Then  I should see "Chocolate Surprise!"
    And   I should see "Chocolate Delight!"
