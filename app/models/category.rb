class Category < ActiveRecord::Base
  has_many :projects, dependent: :destroy

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  scope :by_name, order('name ASC')

  def self.options_hash
    all.collect {|c| [c.name, c.id]}
  end
end
