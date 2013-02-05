class Category < ActiveRecord::Base
  has_many :projects, dependent: :destroy

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  scope :by_name, order('name ASC')
end
