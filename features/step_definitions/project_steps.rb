Given /^I have projects:$/ do |projects_table|
  table_to_attributes(projects_table).each do |project_attributes|
    category = Category.find_by_name! project_attributes.delete(:category)
    create :project, project_attributes.merge(category_id: category.id, is_reviewed: true)
  end
end
