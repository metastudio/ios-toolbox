Then /^I should see "(.*?)"$/ do |content|
  page.should have_content content
end

Then /^I should not see "(.*?)"$/ do |content|
  page.should_not have_content content
end

When /^I click on "(.*?)" tag$/ do |link|
  click_on link
end
