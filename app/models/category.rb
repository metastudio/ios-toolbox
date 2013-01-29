class Category < ActiveRecord::Base
  has_many :projects, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :by_name, order('name ASC')
end
