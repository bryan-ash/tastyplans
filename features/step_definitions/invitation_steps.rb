Given /^I am a new, authenticated user with 1 invitation available$/ do
  step %{a user with Email "a@b.net" and 1 invitation}
  step %{I sign in with "a@b.net"}
end

When /^I invite "([^\"]+)"$/ do |email|
  step %{I follow "Invite a friend"}
  step %{I fill in "Enter your friend's email address" with "#{email}"}
  step %{I press "Send invitation to your friend"}
end

Then /^"([^\"]+)" should receive an invitation email$/ do |email|
  step %{"#{email}" should receive an email with subject "Invitation to join TastyPlans"}
  step %{I open the email}
  step %{I should see "You are invited to join TastyPlans" in the email body}
end
