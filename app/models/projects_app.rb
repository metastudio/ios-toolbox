class ProjectsApp < ActiveRecord::Base
  belongs_to :project
  belongs_to :app

  validates :project, presence: true
  validates :app, presence: true
end
