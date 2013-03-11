ActiveAdmin.register Category do
  form do |f|
    f.inputs 'Main' do
      f.input :parent, collection: Category.roots.map{|c| [c.name, c.id]}
      f.input :name
    end

    f.buttons
  end  
end
