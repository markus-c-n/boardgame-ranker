class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :total_score
      t.integer :city_points
      t.integer :coin_points
      t.integer :event_points
      t.integer :extra_points
      t.string :game_mode

      t.timestamps
    end
  end
end
