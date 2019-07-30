class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :court_id

      t.datetime :datetime

      t.timestamps
    end
  end
end
