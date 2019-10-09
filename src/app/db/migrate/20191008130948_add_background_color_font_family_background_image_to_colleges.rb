class AddBackgroundColorFontFamilyBackgroundImageToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :background_color, :string
    add_column :colleges, :font_family, :string
    add_column :colleges, :background_image, :string
  end
end
