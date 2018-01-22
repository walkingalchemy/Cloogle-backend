class Board < ApplicationRecord
  has_many :puzzle_boards
  has_many :boards, through: :puzzles

end
