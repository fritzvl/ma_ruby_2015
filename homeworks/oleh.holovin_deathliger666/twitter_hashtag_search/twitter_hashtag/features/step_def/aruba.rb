require 'aruba'

Then /^the output should contain (.+) tweets?$/ do |num|
  all_output.scan(/(~)\s+/).size.should eq(num.to_i)
end