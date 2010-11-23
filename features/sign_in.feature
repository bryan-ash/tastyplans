Feature: Sign in

  Scenario: Sign in with email
    Given a user with Email "john@doe.com"
    When  I sign in with "john@doe.com"
    Then  I should be on the home page

  Scenario: Sign in with username
    Given a user with Username "john"
    When  I sign in with "john"
    Then  I should be on the home page

  Scenario: email is not case sensitive
    Given a user with Email "John@Doe.com"
    When  I sign in with "john@doe.com"
    Then  I should be on the home page

  Scenario: username is not case sensitive
    Given a user with Username "John"
    When  I sign in with "john"
    Then  I should be on the home page

  Scenario: I forgot my password
    Given a user with Email "john@doe.com"
    When  I request a password reset with Email "john@doe.com"
    Then  I should receive a password reset email at "john@doe.com"

    Given I click the first link in the email
    When  I provide a new password
    Then  I should know that I'm logged in
