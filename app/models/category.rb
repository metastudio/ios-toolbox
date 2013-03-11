class Category < ActiveRecord::Base
  acts_as_nested_set

  has_many :projects, dependent: :destroy

  attr_accessible :name, :parent_id

  validates :name, presence: true, uniqueness: true

  scope :by_name, order('categories.name ASC')
  scope :with_projects, lambda {
    categories = Category.arel_table
    projects   = Project.arel_table
    
    where(Project.where(projects[:category_id].eq(categories[:id])).exists)
  }

  def self.options_hash
    cats = roots.map do |parent|
      [[parent.name, parent.id]] + 
        parent.descendants.map {|child| ["#{parent.name}/#{child.name}", child.id]}
    end
    cats.flatten(1)
  end
end
