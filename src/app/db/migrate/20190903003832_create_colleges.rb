class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.string :name, null:false, default:''
      t.string :initials, default:''
      t.string :city, null:false, default:''
      t.string :state, null:false, default:''
      t.string :country, null:false, default:''
      t.string :unit, default:''

      t.timestamps
    end
  end
end
