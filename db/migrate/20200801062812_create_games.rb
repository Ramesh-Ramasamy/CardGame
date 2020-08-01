class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :player1, null: false, foreign_key: false
      t.references :player2, null: false, foreign_key: false
      t.string :status
      t.integer :win

      t.timestamps
    end
  end
end
