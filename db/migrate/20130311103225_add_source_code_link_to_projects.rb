class AddSourceCodeLinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :source_code_url, :string
  end
end
