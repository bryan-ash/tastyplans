Given /^I am not authenticated$/ do
  visit('/users/sign_out')
end

Given /^a user with Username "([^\"]*)", Email "([^\"]*)" and Password "([^\"]*)"$/ do |username, email, password|
  User.new(:email                 => email,
           :username              => username,
           :password              => password,
           :password_confirmation => password).save!
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
