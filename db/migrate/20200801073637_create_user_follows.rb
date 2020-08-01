class CreateUserFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :user_follows do |t|
      t.references :player1, null: false, foreign_key: false
      t.references :player2, null: false, foreign_key: false
      t.string :status

      t.timestamps
    end
  end
end
