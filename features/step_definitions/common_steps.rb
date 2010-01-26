Then /^(.+) should be listed before (.+) on the (.+) page$/ do |first, second, page|
  visit page
  first_position  = (response.body =~ /#{first}/)
  second_position = (response.body =~ /#{second}/)
  first_position.should < second_position  
end
