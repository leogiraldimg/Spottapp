class AddRequestToParticipateAdminApprovesSpottedToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :request_to_participate, :string
    add_column :colleges, :admin_approves_spotted, :string
  end
end
