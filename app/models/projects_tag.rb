class ProjectsTag < ActiveRecord::Base
  belongs_to :project
  belongs_to :tag

  attr_accessible :project_id, :tag_id

  validates :project_id, presence: true
  validates :tag_id, presence: true, uniqueness: { scope: :project_id }
end
