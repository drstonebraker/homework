class UsersController < ApplicationController
  before_action :require_no_user!, only: %i(new create)
  before_action :require_user!, only: %i(show)

  def new
    @user = User.new(email: flash[:email])
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
      # redirect_to bands_url
    else
      flash[:errors] = @user.errors.full_messages
      flash[:email] = user_params[:email]
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
