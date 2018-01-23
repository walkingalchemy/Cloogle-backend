class Board < ApplicationRecord
  has_many :board_users
  has_many :users, through: :board_users


  # validates :height, :width, presence: true
  # before_create :build_grid


  # def build_grid
  #   # self.grid = Array.new(height) {
  #   #   Array.new(width) {'*,*,*'}
  #   # }
  #   self.grid = []
  #   width.times do |x|
  #     result = []
  #     height.times do |y|
  #       result << "#{x},#{y},*"
  #     end
  #     self.grid << result
  #   end
  #
  # end
  #
  # def row(index)
  #   grid[index]
  # end
  #
  # def set_row(index, word_array)
  #   grid[index] = word_array
  # end
  #
  # def column(index)
  #   grid.map{|r| r = r[index]}
  # end
  #
  # def set_column(index, word_array)
  #   grid.each_with_index {|r,i| r[index] = word_array[i]}
  # end
  #
  # def across(index)
  #   row(index).join
  # end
  #
  # def down(index)
  #   column(index).join
  # end
  #
  # def across_words
  #   grid.map do |r|
  #     r.join
  #   end
  # end
  #
  # def down_words
  #   dwords = []
  #   grid[0].each_with_index do |c,i|
  #     dwords << down(i)
  #   end
  #   return dwords
  # end
  #
  # def location_select
  #   # "dynamic search rearrangement"
  #   # if this is the first pass, return 0 across
  #   # else return the location with the least options
  # end
  #
  #
  # def calculate_min_loss(location, number_of_words) # location is a {board[x,y]: length}
  #   # coordinate that represents the start and length of a word on the board
  #   # open_crosses = # an array representing all word locations that cross this location on board that are still open
  #
  #   possibilities = {}
  #   #get a random set of possible words to test
  #   possible_words = Puzzle.all.select do |word|
  #     # word is placeable given location length and current letters
  #   end
  #   number_of_words.times do
  #     word = possible_words.sample
  #     possibilities[word] = 1
  #   end
  #
  #   possibilities.map do |word, count|
  #     open_crosses.each do |cross|
  #     # count*= #count all puzzle words that can fill this cross given word is in location
  #     end
  #   end
  #
  #   return possibilities.max_by {|w,v| v}
  #
  #
  # end
  #
  #
  # def backjumping
  #   #try potential placement
  #   #if you succeed backjump from new placement
  #   #if you fail check for puzzle completion
  #   # if complete return puzzle
  #   #if incomplete remove placements back to the point where the most recent cross of your failure was placed and try a different word
  #   #
  # end
end
