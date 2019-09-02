class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end
