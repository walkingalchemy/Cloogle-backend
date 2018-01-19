class CreatePuzzleBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzle_boards do |t|
      t.belongs_to :puzzle, foreign_key: true
      t.belongs_to :board, foreign_key: true

      t.timestamps
    end
  end
end
