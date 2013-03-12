class CreateProjectsApps < ActiveRecord::Migration
  def change
    create_table :projects_apps do |t|
      t.references(:project)
      t.references(:app)

      t.timestamps
    end

    add_index :projects_apps, [:project_id, :app_id], unique: true
  end
end
