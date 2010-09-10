Feature: Sign in

  Scenario: Sign in with email
    Given I am a user with email "john@doe.com"
    When I sign in with "john@doe.com"
    Then I should be on the home page

  Scenario: Sign in with username
    Given I am a user with username "john"
    When I sign in with "john"
    Then I should be on the home page
