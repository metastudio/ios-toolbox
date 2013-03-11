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
    all.collect {|c| [c.name, c.id]}
  end
end
