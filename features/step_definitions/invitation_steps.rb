When /^I invite "john@doe.com"$/ do
  When %{I follow "Invite a friend"}
  And  %{I fill in "Enter your friend's email address" with "john@doe.com"}
  And  %{I press "Send invitation to your friend"}
end

Then /^"john@doe.com" should receive an invitation email$/ do
  And  %{"john@doe.com" should receive an email with subject "Invitation to join TastyPlans"}
  When %{I open the email}
  Then %{I should see "Someone has invited you to TastyPlans" in the email body}
end
