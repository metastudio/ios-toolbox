class CreateProjectsTags < ActiveRecord::Migration
  def change
    create_table :projects_tags do |t|
      t.integer :project_id, :null => false
      t.integer :tag_id, :null => false

      t.timestamps
    end
    
    add_index :projects_tags, [:project_id, :tag_id], :unique => true
  end
end
