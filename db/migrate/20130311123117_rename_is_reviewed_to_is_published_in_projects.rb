class RenameIsReviewedToIsPublishedInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :is_reviewed, :is_published
  end
end
