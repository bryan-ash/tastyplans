Then /^I should be able to request a beta$/ do
  within("header") do
    click_link("Sign up")
  end
  step %{I should be on the beta request page}
end
