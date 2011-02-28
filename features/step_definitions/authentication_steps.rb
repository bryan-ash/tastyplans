Before do
  set_demo_as_current_user
end

def set_demo_as_current_user
  @current_scenario_user = User.demo
end

Given /^I am signed out$/ do
  visit destroy_user_session_path
  set_demo_as_current_user
end

Given /^an? (admin|user) with(?: Username "([^\"]*)")?,?(?: Email "([^\"]+)")?(?: and Password "([^\"]+)")?(?: and (\d) invitations?)?$/ do |role, username, email, password, invitations|
  password ||= "password"
  username ||= "user"
  email ||= "#{username}@home.com"
  admin = (role == "admin")
  invitations ||= 1

  @current_scenario_user =
    User.find_or_create_by_email(:email                 => email,
                                 :username              => username,
                                 :password              => password,
                                 :password_confirmation => password,
                                 :invitations           => invitations)
  @current_scenario_user.update_attribute(:admin, admin)
end

Given /^I am a new, authenticated user$/ do
  Given %{a user with Email "a@b.net"}
  And   %{I sign in with "a@b.net"}
end

Given /^I am signed in with ([^ ]+) "([^\"]+)"(?: and password "([^\"]+)")?$/ do |field, value, password|
  password ||= "password"
  username = (field == "username") ? value : "user"
  email = (field == "email") ? value : "#{username}@home.com"
  Given %{a user with Username "#{username}", Email "#{email}" and Password "#{password}"}
  And   %{I sign in with "#{value}" and password "#{password}"}
end

Given /^I am signed in as an admin$/ do 
  Given %{an admin with Username "Admin"}
  When  %{I sign in with "Admin"}
end

When /^I sign up with ([^ ]+) "([^\"]+)"$/ do |attribute, value|
  Given %{I am on the sign up page}
  When  %{I fill in "#{attribute}" with "#{value}"}
  And   %{I press "Sign up"}
end

When /^I sign in with "([^\"]+)"(?: and password "([^\"]+)")?$/ do |login, password|
  password ||= "password"
  visit new_user_session_path
  fill_in "user_email", :with => login
  fill_in "user_password", :with => password
  click_button "Sign in"
end

When /^I commit my account changes with password "([^\"]+)"$/ do |password|
  And  %{I fill in "Enter your current password to confirm changes" with "#{password}"}
  And  %{I press "Save account changes"}
end

When /^I change my username to "([^\"]+)"$/ do |username|
  When %{I go to the edit user page}
  And  %{I fill in "Please choose a user name" with "#{username}"}
  And  %{I commit my account changes with password "password"}
end

When /^I change my email to "([^\"]+)"$/ do |email|
  When %{I go to the edit user page}
  And  %{I fill in "Enter a new email address if you would like to change it" with "#{email}"}
  And  %{I commit my account changes with password "password"}
end

When /^I change my password from "([^\"]+)" to "([^\"]+)"$/ do |old_password, new_password|
  When %{I go to the edit user page}
  And  %{I fill in "Enter a new password" with "#{new_password}"}
  And  %{I fill in "Confirm your new password" with "#{new_password}"}
  And  %{I commit my account changes with password "#{old_password}"}
end

When /^I update my account with a new password and confirmation that don\'t match, using password "([^\"]+)"$/ do |old_password|
  When %{I go to the edit user page}
  And  %{I fill in "Enter a new password" with "something"}
  And  %{I fill in "Confirm your new password" with "different"}
  And  %{I commit my account changes with password "#{old_password}"}
end

When /^I request a password reset with Email "([^\"]+)"$/ do |email|
  visit new_user_session_path
  click_link "Forgot your password?"
  fill_in "user_email", :with => email
  click_button "Send me reset password instructions"
end

When /^I provide a new password$/ do
  When 'I fill in "Password" with "Secret"'
  And  'I fill in "Password confirmation" with "Secret"'
  And  'I press "Update my password and sign me in"'
end

Then /^I should receive a password reset email at "([^\"]+)"$/ do |email|
  Given %{"#{email}" should have 1 email}
  When  %{I open the email}
  Then  %{I should see "Reset password instructions" in the email subject}
end

Then /^I should know that I\'m logged in$/ do
  Then 'I should see "Sign out"'
end
