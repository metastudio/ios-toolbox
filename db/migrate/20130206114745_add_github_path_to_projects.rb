class AddGithubPathToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :github_path, :string
  end
end
