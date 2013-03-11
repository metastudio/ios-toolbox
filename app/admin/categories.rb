ActiveAdmin.register Category do
  form do |f|
    f.inputs 'Main' do
      f.input :parent
      f.input :name
    end

    f.buttons
  end  
end
