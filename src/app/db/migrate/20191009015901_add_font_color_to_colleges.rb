class AddFontColorToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :font_color, :string
  end
end
