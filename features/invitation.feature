Feature: Invitations

  Scenario: Send an email to invite a friend
    Given I am a new, authenticated user
    When I invite "john@doe.com"
    Then I should see "Your invitation has been sent, thank you!"
    And "john@doe.com" should receive an invitation email

    When I click the first link in the email

  Scenario: Invitations can only be sent when signed in
    Given I am signed out
    Then I should not see "Invite a friend"

    When I go to the new invitation page
    Then I should see "Please sign in. We don't want just anyone sending invitations!"

  Scenario: The number of invitations a user can make is limited
    Given I am a new, authenticated user with 1 invitation available
    When I invite "jane@doe.com"
    Then I should not see "Invite a friend"