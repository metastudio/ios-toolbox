World ActionController::RecordIdentifier

When /^I go to the dashboard page$/ do
  visit root_path
end

Then /^I should see next "(.*?)" projects:$/ do |category, projects_table|
  category = Category.find_by_name! category
  page.within("##{dom_id(category)}") do
    projects_table.raw.flatten.each do |project_name|
      page.should have_content project_name
    end
  end
end
