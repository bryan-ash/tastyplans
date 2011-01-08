Feature: Error Handling

  Scenario: User requests an invalid URL
    When I go to an invalid URL
    Then I should see "Sorry, the page you requested was not found"

  @allow-rescue
  Scenario: User requests an invalid resource
    Given I am a new, authenticated user
    When I go to an invalid resource
    Then I should see "Sorry, the page you requested was not found"
