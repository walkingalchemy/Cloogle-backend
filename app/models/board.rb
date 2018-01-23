class Board < ApplicationRecord
  has_many :puzzle_boards
  has_many :puzzles, through: :boards
  validates :height, :width, presence: true
  before_create :build_grid

  def build_grid
    self.grid = Grid.new(self.width, self.height)
  end

  def across_words
    rows.map do |row|
      grid.cells_in_row(row).map(&:letter).join
    end
  end

  def down_words
    columns.map do |column|
      grid.cells_in_column(column).map(&:letter).join
    end
  end


  def calculateMinLoss(location, number_of_words) # location is a {board[x,y]: length}
    # coordinate that represents the start and length of a word on the board
    open_crosses = # an array representing all word locations that cross this location on board that are still open

    possibilities = {}
    #get a random set of possible words to test
    possible_words = Puzzle.all.select do |word|
      # word is placeable given location length and current letters
    end
    number_of_words.times do
      word = possible_words.sample
      possibilities[word] = 1
    end

    possibilities.map do |word, count|
      open_crosses.each do |cross|
      count*= #count all puzzle words that can fill this cross given word is in location
      end
    end

    return possibilities.max_by {|w,v| v}


  end
end
