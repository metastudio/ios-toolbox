class AddUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :url, :string, null: false
  end
end
