class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :team_one_id
      t.integer :team_two_id

      t.timestamps
    end
  end
end
