class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :type
      t.integer :number

      t.timestamps
    end
    Card.subclasses.each do |sc|
      (1..13).each do |num|
        sc.create(:number => num)
      end
    end
  end
end
