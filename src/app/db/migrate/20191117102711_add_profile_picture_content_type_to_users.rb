class AddProfilePictureContentTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_picture_content_type, :string
  end
end
