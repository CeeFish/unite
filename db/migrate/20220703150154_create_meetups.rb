class CreateMeetups < ActiveRecord::Migration[6.1]
  def change
    create_table :meetups do |t|
      t.string :title
      t.string :location
      t.string :user
      t.string :group

      t.timestamps
    end
  end
end
