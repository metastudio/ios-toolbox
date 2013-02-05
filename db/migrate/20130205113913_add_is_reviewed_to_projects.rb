class AddIsReviewedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_reviewed, :boolean, null: false, default: false
  end
end
