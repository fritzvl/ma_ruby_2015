ActiveAdmin.register Post do

  permit_params :title, :body

  index do
    selectable_column
    id_column
    column :title
    column :body
    column 'Author' do |post|
      post.author.email
    end
    actions
  end

  form do |f|
    f.inputs 'Post Details' do
      f.input :title
      f.input :body
    end
    f.actions
  end

  after_build do |post|
    post.author_id = current_author.id
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
