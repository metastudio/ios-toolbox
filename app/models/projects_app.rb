class ProjectsApp < ActiveRecord::Base
  belongs_to :project
  belongs_to :app

  validates :project_id, presence: true
  validates :app_id, presence: true, uniqueness: {scope: :project_id}
end
