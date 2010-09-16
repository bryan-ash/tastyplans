Feature: Authentication

  Scenario: Sign up successfully
    Given I am on the sign up page

    When I fill in "Username" with "JD"
    And  I fill in "Email" with "john@doe.com"
    And  I fill in "Password" with "secret"
    And  I fill in "Password confirmation" with "secret"
    And  I press "Sign up"

    Then I should see "successfull"

  Scenario: Username must be unique
    Given a user with Username "JD"

    When  I sign up with Username "JD"
    Then  I should see "Username is already taken, please choose another"

    When  I sign up with Username "jd"
    Then  I should see "Username is already taken, please choose another"

  Scenario: Email is validated
    When  I sign up with Email "john.doe.com"
    Then  I should see "Email is invalid"

  Scenario: Each user must have a different email
    Given a user with Email "john@doe.com"
    When  I sign up with Email "john@doe.com"
    Then  I should see "Email has already been taken"

  Scenario: Password is validated
    When  I sign up with Password "123"
    Then  I should see "doesn't match confirmation"
    And   I should see "too short"
