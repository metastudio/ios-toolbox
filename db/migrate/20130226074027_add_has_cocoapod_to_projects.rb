class AddHasCocoapodToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :has_cocoapod, :bool, null: false, default: false
  end
end
