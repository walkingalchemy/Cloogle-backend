class Api::V1::BoardUsersController < ApplicationController
  def show
    @board_user = find_board_user
    render json: {board_user: @board_user}
  end


  def create
    @board_user = BoardUser.new(board_user_params)

   if @board_user.valid?
     @board_user.save
     render json: {message: "succerse"}
   else
     render json: {errors: @board_user.errors.full_messages}, status: 422
   end

 end

 def update
   @board_user = find_board_user
   if @board_user.update(board_user_params)
     render json: {message: "success"}
   else
     render json: {errors: @board_user.errors.full_messages}, status: 422
   end
 end

 def update_progress
   @board_user = find_board_user

   if @board_user
     @board_user.progress[params["index"]] = params["value"]
     byebug
   end
 end


  private
   def board_user_params
     params.permit(:user_id, :board_id, :completed)
   end

   def find_board_user
     BoardUser.find_by(user_id: params[:user_id], board_id: params[:board_id])
   end


end
