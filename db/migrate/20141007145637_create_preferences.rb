class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :like
      t.string :dislike
      t.integer :user_id

      t.timestamps
    end
  end
end
