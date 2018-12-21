class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to my_account_path, notice: 'Successfully asdasd registered!'
    else
      flash[:notice] = 'Please check your details'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
