Feature: Meal Plan

  Background:
    Given I am a new, authenticated user

  Scenario: A logged in user can start a new plan
    When I follow "Start a new plan"
    Then the plan should be named with this week's date

  Scenario: Only my plans are listed
    Given "another" user has a meal plan
    When I go to my meal plans page
    Then I should not see "another" user's plans

  Scenario: Plan name is editable
    Given I follow "Start a new plan"
    And   I fill in "Give this meal plan a name" with "Next Week"
    And   I press "Save this meal plan"
    When I go to my meal plans page
    Then I should see "Next Week"

  Scenario: I can only edit my own plans
    Given "another" user has a meal plan
    When I edit "another" user's meal plan
    Then I should see "You don't have permission to do that"

  Scenario: Show a meal plan
    Given I have a meal plan named "Next Week" with the following meals:
      | recipe      |
      | Bacon Butty |
      | Ice Cream   |
      
    When I go to the edit meal plan "Next Week" page

    Then I should see "Bacon Butty"
    And  I should see "Ice Cream"

  Scenario: I can add recipes to my current meal plan
    Given I have a current meal plan named "This Week"
    And I add recipe "Bacon Butty" to my current meal plan
    And I go to the edit meal plan "This Week" page
    Then I should see "Bacon Butty" within "article"

  Scenario: I can choose a different meal plan as the current
    Given I have a current meal plan named "This Week"
    And I have a meal plan named "Next Week"
    When I make "Next Week" my current meal plan
    Then the "Make this your current meal plan" checkbox should be checked

  Scenario: I can get directly to my current meal plan
    Given I have a current meal plan named "Big Plan"
    When I follow "My current plan"
    Then I should be on the edit meal plan "Big Plan" page

  Scenario: When I start a new meal plan it is marked Current by default
    When I go to the start new meal plan page
    Then the "Make this your current meal plan" checkbox should be checked

  Scenario: Recipes can be removed from a meal plan
    Given recipe "Removed Recipe" is in my current meal plan
    When I remove "Removed Recipe" from my current meal plan
    Then "Removed Recipe" should not be in my current meal plan
