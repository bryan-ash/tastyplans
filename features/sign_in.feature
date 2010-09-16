Feature: Sign in

  Scenario: Sign in with email
    Given a user with Email "john@doe.com"
    When  I sign in with "john@doe.com"
    Then  I should be on the home page

  Scenario: Sign in with username
    Given a user with Username "john"
    When  I sign in with "john"
    Then  I should be on the home page
