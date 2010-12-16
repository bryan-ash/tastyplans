Then /^"([^\"]+)" should be listed before "([^\"]+)" on (.+)$/ do |first, second, page_name|
  visit path_to(page_name)
  
  first_position  = (body =~ /#{first}/)
  second_position = (body =~ /#{second}/)
  first_position.should < second_position  
end

Then /^I should see "(.+)" once$/ do |text|
  text.scan(text).length.should == 1
end
