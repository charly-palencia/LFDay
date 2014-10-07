class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id_1
      t.integer :user_id_2

      t.timestamps
    end
  end
end
