When /^I fetch new rating information for projects:$/ do |projects_table|
  projects_table.raw.flatten.each do |project_name|
    project = Project.find_by_name! project_name
    project.update_rating
  end
end

Then /^project "(.*?)" should be ranked higher than "(.*?)"$/ do |project1_name, project2_name|
  project1 = Project.find_by_name! project1_name
  project2 = Project.find_by_name! project2_name

  project1.rating.should > project2.rating
end
