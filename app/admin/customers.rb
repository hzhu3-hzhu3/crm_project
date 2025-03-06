ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :phone_number, :email, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :full_name, :phone_number, :email, :notes, :image
  

  remove_filter :image_attachment
  remove_filter :image_blob
  remove_filter :image
  

  form do |f|
    f.inputs "Client Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
  
    show do
      attributes_table do
        row :full_name
        row :phone_number
        row :email
        row :notes
        row :image do |customer|
          if customer.image.attached?
            image_tag url_for(customer.image), style: "max-width: 150px;"
          else
            "No Image"
          end
        end
      end
    end
  end