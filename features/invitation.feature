Feature: Invitations

  Scenario: Send an email to invite a friend
    Given I am a new, authenticated user
    When I follow "Invite a friend"
    And I fill in "Enter your friend's email address" with "john@doe.com"
    And I press "Send invitation to your friend"
    Then I should see "Your invitation has been sent, thank you!"
    And "john@doe.com" should receive an email with subject "Invitation to join MabelMeals"
    When I open the email
    Then I should see "Someone has invited you to MabelMeals" in the email body
    When I click the first link in the email

