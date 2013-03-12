When /^I add "(.*?)" tag for "(.*?)"$/ do |tag_name, project_name|
  project = Project.find_by_name! project_name
  tag = Tag.find_or_create_by_name! tag_name
  
  visit edit_admin_project_path(project)

  page.within('#project_tags_input') do
    check tag.name
  end

  click_on 'Update Project'
end

Then /^I should see tags associated with "(.*?)":$/ do |project_name, tags_table|
  project = Project.find_by_name! project_name
  visit project_path(project)
  tags_table.raw.flatten.each do |tag|
    page.should have_content tag
  end
end

Given /^the following projects tagged with "(.*?)":$/ do |tag_name, projects_table|
  tag = Tag.find_or_create_by_name! tag_name
  Project.where(name: projects_table.raw.flatten).each do |project|
    project.tags << tag
  end
end
