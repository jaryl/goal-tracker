class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(session_params)
    if user.present?
      session[:current_user_id] = user.id
      redirect_to my_goals_path, notice: 'You have logged in successfully'
    else
      flash[:notice] = 'Incorrect email or password'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_session_path, notice: 'You have been logged out'
  end

  private

  def session_params
    params.permit(:email, :password)
  end

end
