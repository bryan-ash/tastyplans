Before do
  set_demo_as_current_user
end

def set_demo_as_current_user
  @current_scenario_user = User.demo
end

Given /^I am signed out$/ do
  visit('/users/sign_out')
  set_demo_as_current_user
end

Given /^a user with Username "([^\"]*)", Email "([^\"]*)" and Password "([^\"]*)"$/ do |username, email, password|
  @current_scenario_user =
    User.find_or_create_by_email(:email                 => email,
                                 :username              => username,
                                 :password              => password,
                                 :password_confirmation => password)
end

Given /^a user with Email "([^\"]*)"$/ do |email|
  Given %{a user with Username "user", Email "#{email}" and Password "password"}
end

Given /^a user with Username "([^\"]*)"$/ do |username|
  Given %{a user with Username "#{username}", Email "#{username}@home.com" and Password "password"}
end

Given /^I am a new, authenticated user$/ do
  Given %{a user with Email "a@b.net"}
  And   %{I sign in with "a@b.net"}
end

When /^I sign up with ([^ ]+) "([^\"]+)"$/ do |attribute, value|
  Given %{I am on the sign up page}
  When  %{I fill in "#{attribute}" with "#{value}"}
  And   %{I press "Sign up"}
end

When /^I sign in with "([^\"]+)"$/ do |login|
  visit "users/sign_in"
  fill_in "user_email", :with => login
  fill_in "user_password", :with => "password"
  click_button "Sign in"
end

When /^I request a password reset with Email "([^\"]+)"$/ do |email|
  visit "users/sign_in"
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
