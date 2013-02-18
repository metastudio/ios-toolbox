FactoryGirl.define do

  factory :category do
    sequence(:name) {|n| "Category #{n}"}
  end

  factory :project do
    name "Example project"
    url "http://whatever.com"
    category
  end

  factory :tag do
    sequence(:name) {|n| "Tag #{n}"}
  end

  factory :projects_tag do
    tag
    project
  end
end
