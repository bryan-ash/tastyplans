Given /^I am not authenticated$/ do
  visit('/users/sign_out')
end

Given /^a user with username "([^\"]*)", email "([^\"]*)" and password "([^\"]*)"$/ do |username, email, password|
  User.new(:email                 => email,
           :username              => username,
           :password              => password,
           :password_confirmation => password).save!
end

Given /^I am a user with email "([^\"]*)"$/ do |email|
  Given %{a user with username "user", email "#{email}" and password "password"}
end

Given /^I am a user with username "([^\"]*)"$/ do |username|
  Given %{a user with username "#{username}", email "#{username}@home.com" and password "password"}
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'

  Given %{a user with username "user", email "#{email}" and password "password"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "password"}
  And %{I press "Sign in"}
end

When /^I sign in with "([^\"]+)"$/ do |login|
  visit "users/sign_in"
  fill_in "user_email", :with => login
  fill_in "user_password", :with => "password"
  click_button "Sign in"
end
