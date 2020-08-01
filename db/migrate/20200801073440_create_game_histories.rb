class CreateGameHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :game_histories do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
