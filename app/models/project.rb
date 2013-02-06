class Project < ActiveRecord::Base
  belongs_to :category

  attr_accessible :name, :url, :category_id, :github_path

  validates :category_id, presence: true
  validates :name, presence: true
  validates :github_path, github_path: true

  scope :by_rating, order('rating desc')
  scope :in_review, where('is_reviewed = ?', false)
  scope :published, where('is_reviewed = ?', true)
end
