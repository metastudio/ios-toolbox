class Project < ActiveRecord::Base
  belongs_to :category

  attr_accessible :name, :url

  validates :category_id, presence: true
  validates :name, presence: true

  scope :by_rating, order('rating desc')
end
