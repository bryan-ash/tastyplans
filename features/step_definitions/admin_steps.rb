When /^I remove the (\d)(st|nd|rd|th) user$/ do |ordinal, indicator|
  within("tr:nth-of-type(#{ordinal})") do
    click_button "remove"
  end
end

Then /^"([^\"]+)" should be the (\d)(st|nd|rd|th) user listed$/ do |username, ordinal, indicator|
  within("tr:nth-of-type(#{ordinal})") do
    page.should have_content(username)
  end
end
