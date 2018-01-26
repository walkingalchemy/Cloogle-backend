require 'open-uri'

class BoardUser < ApplicationRecord
  belongs_to :board
  belongs_to :user
  after_create :generate_progress

  def generate_progress
    # fetch the thing
    grid = JSON.parse(Nokogiri::HTML(open(self.board.board_url)))["grid"]
    self.progress = grid.map do |el|
      if el != "."
        el = ""
      else
        el
      end
    end
    self.save
  end


end
