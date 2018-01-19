class Puzzle < ApplicationRecord
  has_many :puzzle_boards
  has_many :boards, through: :puzzle_boards
end
