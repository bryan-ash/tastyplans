Before do
  set_demo_as_current_user
end

def set_demo_as_current_user
  @current_scenario_user = User.demo
end

Given /^I am signed out$/ do
  page.driver.submit :delete, destroy_user_session_path, {}
  set_demo_as_current_user
end

Given /^an? (admin|user) with(?: Username "([^\"]*)")?,?(?: Email "([^\"]+)")?(?: and Password "([^\"]+)")?(?: and (\d+) invitations?)?$/ do |role, username, email, password, invitations|
  password ||= "password"
  username ||= "user"
  email ||= "#{username}@home.com"
  admin = (role == "admin")
  invitations ||= 1

  @current_scenario_user =
    User.create_with(:username              => username,
                     :password              => password,
                     :password_confirmation => password,
                     :invitations           => invitations).
    find_or_create_by(:email => email)
  @current_scenario_user.update_attribute(:admin, admin)
end

Given /^I am a new, authenticated user$/ do
  step %{a user with Email "a@b.net"}
  step %{I sign in with "a@b.net"}
end

Given /^I am signed in with ([^ ]+) "([^\"]+)"(?: and password "([^\"]+)")?$/ do |field, value, password|
  password ||= "password"
  username = (field == "username") ? value : "Mr. User"
  email = (field == "email") ? value : "#{username}@home.com"
  step %{a user with Username "#{username}", Email "#{email}" and Password "#{password}"}
  step %{I sign in with "#{value}" and password "#{password}"}
end

Given /^I am signed in as an admin$/ do 
  step %{an admin with Username "Admin"}
  step %{I sign in with "Admin"}
end

When /^I sign up with ([^ ]+) "([^\"]+)"$/ do |attribute, value|
  step %{I am on the sign up page}
  step %{I fill in "#{attribute}" with "#{value}"}
  step %{I press "Sign up"}
end

When /^I sign up with a short password and no confirmation$/ do
  step %{I am on the sign up page}
  step %{I fill in "Username" with "JD"}
  step %{I fill in "Email" with "john@doe.com"}
  step %{I fill in "Password" with "123"}
  step %{I press "Sign up"}
end

When /^I sign in with "([^\"]+)"(?: and password "([^\"]+)")?$/ do |login, password|
  password ||= "password"
  visit new_user_session_path
  fill_in "user_email", :with => login
  fill_in "user_password", :with => password
  click_button "Sign in"
end

When /^I commit my account changes with password "([^\"]+)"$/ do |password|
  step %{I fill in "Enter your current password to confirm changes" with "#{password}"}
  step %{I press "Save account changes"}
end

When /^I change my username to "([^\"]+)"$/ do |username|
  step %{I go to the edit user page}
  step %{I fill in "Please choose a user name" with "#{username}"}
  step %{I commit my account changes with password "password"}
end

When /^I change my email to "([^\"]+)"$/ do |email|
  step %{I go to the edit user page}
  step %{I fill in "Enter a new email address if you would like to change it" with "#{email}"}
  step %{I commit my account changes with password "password"}
end

When /^I change my password from "([^\"]+)" to "([^\"]+)"$/ do |old_password, new_password|
  step %{I go to the edit user page}
  step %{I fill in "Enter a new password" with "#{new_password}"}
  step %{I fill in "Confirm your new password" with "#{new_password}"}
  step %{I commit my account changes with password "#{old_password}"}
end

When /^I update my account with a new password and confirmation that don\'t match, using password "([^\"]+)"$/ do |old_password|
  step %{I go to the edit user page}
  step %{I fill in "Enter a new password" with "something"}
  step %{I fill in "Confirm your new password" with "different"}
  step %{I commit my account changes with password "#{old_password}"}
end

When /^I update "([^\"]+)" with Username "([^\"]+)", Email "([^\"]+)" and (\d+) invitations$/ do |old_name, new_name, email, invitations|
  step %{I go to the list users page}
  step %{I follow "#{old_name}"}
  step %{I fill in "Username" with "#{new_name}"}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Invitations remaining" with "#{invitations}"}
  step %{I press "Update User"}
end

When /^I request a password reset with Email "([^\"]+)"$/ do |email|
  visit new_user_session_path
  click_link "Forgot your password?"
  fill_in "user_email", :with => email
  click_button "Send me reset password instructions"
end

When /^I provide a new password$/ do
  step 'I fill in "Password" with "Secret"'
  step 'I fill in "Password confirmation" with "Secret"'
  step 'I press "Update my password and sign me in"'
end

Then /^I should receive a password reset email at "([^\"]+)"$/ do |email|
  step %{"#{email}" should have 1 email}
  step %{I open the email}
  step %{I should see "Reset password instructions" in the email subject}
end

Then /^I should know that I\'m logged in$/ do
  step 'I should see "Sign out"'
end
