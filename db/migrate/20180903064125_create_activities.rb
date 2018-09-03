class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.reference :user
      t.reference :room
      t.integer :action, default: 1

      t.timestamps
    end
  end
end
