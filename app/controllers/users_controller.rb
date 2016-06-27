class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "Successfully Signed Up"
    else
      render :new, alert: "Something is not right..."
    end
  end

  def show
    @user = User.find params[:id]
    @ideas = Idea.where(user_id: @user)
    @likes = Like.where(user_id: @user)
    @members_of = Member.where(user_id: @user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
