class CreatePuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzles do |t|
      t.string :word
      t.string :hint

      t.timestamps
    end
  end
end
