class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.integer :action, default: 1

      t.timestamps
    end
  end
end
