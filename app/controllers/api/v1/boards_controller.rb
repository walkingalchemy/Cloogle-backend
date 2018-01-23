class Api::V1::BoardsController < ApplicationController
  def index
    @boards = Board.all
    render json: @boards
  end

  def show
    @board = Board.find(params[:id])
    @puzzles = @board.puzzles
    render json: {board: @board, puzzles: @puzzles}
  end
end
