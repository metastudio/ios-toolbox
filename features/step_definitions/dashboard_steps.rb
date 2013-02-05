module DashboardStepsHelpers
  def within_category(category_name, &block)
    category = Category.find_by_name! category_name
    page.within "##{dom_id(category)}", &block
  end
end
World DashboardStepsHelpers

World ActionController::RecordIdentifier

When /^I go to the dashboard page$/ do
  visit root_path
end

Then /^I should see next "(.*?)" projects:$/ do |category_name, projects_table|
  within_category(category_name) do
    projects_table.raw.flatten.each do |project_name|
      page.should have_content project_name
    end
  end
end

Then /^I should see next "(.*?)" projects in given order:$/ do |category_name, projects_table|
  project_names = projects_table.raw.flatten
  within_category(category_name) do
    project_names.each_with_index do |project_name, project_index|
      page.should have_selector("li:nth-child(#{project_index+1})", text: project_name)
    end
  end
end
