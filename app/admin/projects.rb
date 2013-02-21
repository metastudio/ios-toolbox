ActiveAdmin.register Project do
  form do |f|
    f.inputs "name" do
      f.input :category_id, :label => "Category", :as => :select, :collection => Category.order(:name)
      f.input :name
      f.input :url
      f.input :rating
      f.input :is_reviewed
      f.input :github_path
      f.input :description
      f.has_many :projects_tags do |projects_tag|
        projects_tag.input :tag, :collection => Tag.order(:name)
      end
    end
    f.buttons
  end
end