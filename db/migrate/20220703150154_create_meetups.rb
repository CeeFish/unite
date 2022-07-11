class CreateMeetups < ActiveRecord::Migration[6.1]
  def change
    create_table :meetups do |t|
      t.string :title
      t.string :location
      t.string :user
      t.integer :group_id
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
