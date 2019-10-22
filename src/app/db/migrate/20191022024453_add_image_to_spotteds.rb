class AddImageToSpotteds < ActiveRecord::Migration[5.2]
  def change
    add_column :spotteds, :image, :string
  end
end
