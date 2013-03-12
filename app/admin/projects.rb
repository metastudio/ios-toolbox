ActiveAdmin.register Project do
  index do
    column :name
    column :is_published
    default_actions
  end

  controller do 
    def role_given?
      true
    end

    def as_role
      { :as => :admin }
    end
  end

  form do |f|
    f.inputs 'Main' do
      f.input :category, collection: Category.options_hash
      f.input :name
      f.input :url
      f.input :description
    end

    f.inputs 'Details' do
      f.input :github_path
      f.input :source_code_url, label: 'Source code URL (if GitHub path does not present)'
    end

    f.inputs 'Publishing' do
      f.input :is_published
    end

    f.inputs 'Associations' do
      f.input :apps, as: :check_boxes
      f.input :tags, as: :check_boxes
    end

    f.actions
  end
end
