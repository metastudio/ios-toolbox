class Tag < ActiveRecord::Base
  has_many :projects_tags, :dependent => :destroy
  has_many :projects, :through => :projects_tags

  attr_accessible :name

  validates :name, presence: true, uniqueness: true
end
