class App < ActiveRecord::Base
  validates :name, presence: true

  has_many :projects_apps, dependent: :destroy
  has_many :projects, through: :projects_apps

  attr_accessible :name, :url
end
