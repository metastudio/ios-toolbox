When /^I submit the following project:$/ do |project_table|
  visit new_project_path
  project_table.hashes.first.each do |field, value|
    if field == 'Category'
      select value, from: field
    else
      fill_in field, with: value
    end
  end
  click_on I18n.t('helpers.submit.project.create')
end

Then /^I should see a thankful message$/ do
  page.should have_content 'Thanks'
end

Then /^there should be "(.*?)" project in moderation queue$/ do |project_name|
  Project.in_review.find_by_name(project_name).should be_present
end
