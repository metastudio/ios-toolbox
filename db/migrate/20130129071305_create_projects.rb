class CreateProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.references :category, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :projects, :category_id
  end
end
