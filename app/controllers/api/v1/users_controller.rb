class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find_or_create_by(name:params[:name])
    @user_boards = @user.boards
    @non_user_boards = Board.all.reject {|board| board.user_ids.include?(@user.id)}
    render json: {user: @user, user_boards: @user_boards, non_user_boards: @non_user_boards}
  end

  def create
    @user = User.new(user_params)

   if @user.valid?
     @user.save
     @user_boards = @user.boards
     @non_user_boards = Board.all.reject {|board| board.user_ids.include?(@user.id)}
     render json: {user: @user, user_boards: @user_boards, non_user_boards: @non_user_boards}
   else
     render json: {errors: @user.errors.full_messages}, status: 422
   end

  end

  def update
  end



  def user_params
    params.permit(:name)
  end
end
