Given /^I have categories:$/ do |categories_table|
  categories_table.raw.flatten.each do |category|
    create :category, name: category
  end
end
