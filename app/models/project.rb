class Project < ActiveRecord::Base
  belongs_to :category

  validates :category_id, presence: true
  validates :name, presence: true
end
