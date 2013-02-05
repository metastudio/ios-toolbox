class AddRatingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :rating, :integer, null: false, default: 0
  end
end
