Given /^I am a new, authenticated user with 1 invitation available$/ do
  Given %{a user with Email "a@b.net" and 1 invitation}
  And   %{I sign in with "a@b.net"}
end

When /^I invite "([^\"]+)"$/ do |email|
  When %{I follow "Invite a friend"}
  And  %{I fill in "Enter your friend's email address" with "#{email}"}
  And  %{I press "Send invitation to your friend"}
end

Then /^"john@doe.com" should receive an invitation email$/ do
  And  %{"john@doe.com" should receive an email with subject "Invitation to join TastyPlans"}
  When %{I open the email}
  Then %{I should see "Someone has invited you to TastyPlans" in the email body}
end
