class CreateSpotteds < ActiveRecord::Migration[5.2]
  def change
    create_table :spotteds do |t|
      t.text :content

      t.timestamps
    end
  end
end
