Feature: Recipe ownership

  Scenario: A user with no recipes is encouraged to create some
    Given I am a new, authenticated user
    When I go to my recipes page
    Then I should see "You haven't created any recipes yet. Please use the 'Add a new recipe' link on the Recipes menu to the left of the page"

  Scenario: Users can see their own recipes
    Given I am a new, authenticated user
    And   I have created a recipe named "My Recipe"
    And   recipe "Another" exists

    When I follow "List my recipes"

    Then I should see "My Recipe" within "article"
    And  I should not see "Another" within "article"