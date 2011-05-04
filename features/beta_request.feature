Feature: Beta registration request

  Scenario: A visitor can request a beta registration
    Given I am signed out
    When I follow "Sign up"
    Then I should be on the beta request page

    When I fill in "Enter your email address" with "me@home.com"
    And I press "Request invitation"
    Then I should see "Thank you for your request, we'll email you when we have a new batch ready"

    Given I am signed in as an admin
    When I follow "Beta requests"
    Then I should see "me@home.com"

    When I press "invite"
    Then "me@home.com" should receive an invitation email

    When I click the first link in the email
    Then I should be on the accept user invitation page

    When I fill in "Username" with "Me"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Set my username and password"
    Then I should see "Your password was set successfully. You are now signed in."
