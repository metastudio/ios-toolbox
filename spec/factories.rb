FactoryGirl.define do

  factory :category do
    sequence(:name) {|n| "Category #{n}"}
  end

  factory :project do
    name "Example project"
    url "http://whatever.com"
    category
  end
  
end
