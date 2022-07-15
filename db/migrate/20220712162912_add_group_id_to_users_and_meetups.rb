class AddGroupIdToUsersAndMeetups < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :group_id, :integer
    remove_column :meetups, :group
    add_column :meetups, :group_id, :integer
  end
end
