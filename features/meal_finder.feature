Feature: Meal Finder

  Scenario: One ingredient found in one recipe
    Given a "Bacon Butty" recipe exists
    And   I am on the meal finder page
    And   I fill in "ingredient" with "bacon"
    When  I press "Try This"
    Then  I should see "bacon"
    Then  I should see "Bacon Butty"
    When  I follow "Bacon Butty"
    Then  I should see "bread"

@wip
  Scenario: Finding using part of the ingredeint name
    Given a "Chocolate Surprise!" recipe has ingredients:
      | amount | unit   | ingredient        |
      | 2      | pounds | chocolate buttons |
    And a "Chocolate Delight!" recipe has ingredients:
      | amount | unit   | ingredient        |
      | 4      | bars   | plain chocolate   |
    And   I am on the meal finder page
    And   I fill in "ingredient" with "chocolate"
    When  I press "Try This"
    Then  I should see "Chocolate Surprise!"
    And   I should see "Chocolate Delight!"
