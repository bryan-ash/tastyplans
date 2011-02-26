Feature: Invitations

  Scenario: Send an email to invite a friend
    Given I am a new, authenticated user
    When I invite "john@doe.com"
    Then I should see "Your invitation has been sent, thank you!"
    And "john@doe.com" should receive an invitation email

    When I click the first link in the email

  Scenario: Invitations can only be sent when signed in