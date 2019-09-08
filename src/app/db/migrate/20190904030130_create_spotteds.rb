class CreateSpotteds < ActiveRecord::Migration[5.2]
  def change
    create_table :spotteds do |t|
      t.text :content
      t.integer :college_spotted_counter

      t.timestamps
    end
  end
end
