FactoryGirl.define do

  factory :category do
    sequence(:name) {|n| "Category #{n}"}
  end

  factory :project do
    name "Example project"
    category
  end
  
end
