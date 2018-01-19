class PuzzleBoard < ApplicationRecord
  belongs_to :puzzle
  belongs_to :board
end
