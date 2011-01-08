Feature: Error Handling

  Scenario: User requests an invalid URL
    When I go to an invalid URL
    Then I should see "Sorry, the page you requested was not found"
