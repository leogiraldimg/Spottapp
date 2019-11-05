class CreateCollegeWhitelists < ActiveRecord::Migration[5.2]
  def change
    create_table :college_whitelists do |t|
      t.integer :status
      
      t.timestamps
    end

    add_reference :college_whitelists, :user, foreign_key: true, null: false
    add_reference :college_whitelists, :college, foreign_key: true, null: false

    add_index :college_whitelists, [:user_id, :college_id], unique: true
  end
end
