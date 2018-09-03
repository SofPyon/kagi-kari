class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :name
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
  end
end
