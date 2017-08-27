class SessionsController < ApplicationController

  def new
    @user = User.new(email: flash[:email])
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ['Invalid email or password']
      flash[:email] = session_params[:email]
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
