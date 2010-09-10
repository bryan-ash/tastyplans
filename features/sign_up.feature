Feature: Authentication

  Scenario: Sign up successfully
    Given I am on the sign up page

    When I fill in "Email" with "john@doe.com"
    And  I fill in "Password" with "secret"
    And  I fill in "Password confirmation" with "secret"
    And  I press "Sign up"

    Then I should see "successfull"

  Scenario: Email is validated
    Given I am on the sign up page

    When I fill in "Email" with "john.doe.com"
    And  I press "Sign up"

    Then I should see "Email is invalid"

  Scenario: Each user must have a different email
    Given I am a user with email "john@doe.com"
    And   I am on the sign up page

    When I fill in "Email" with "john@doe.com"
    And  I press "Sign up"

    Then I should see "Email has already been taken"

  Scenario: Password is validated
    Given I am on the sign up page

    When I fill in "Password" with "123"
    And  I press "Sign up"

    Then I should see "doesn't match confirmation"
    And  I should see "too short"
