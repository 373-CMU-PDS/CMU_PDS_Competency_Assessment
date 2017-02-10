class UsersController < ApplicationController
  include AssessmentHelpers::Authentication

  before_action :check_authentication, only: [:logout, :edit, :update]

  # This controller handles administrator accounts. It uses the helper methods
  # from the /lib/helpers/authentication.rb file to handle encryption and
  # storing information in the session.

  def new
    flash[:notice] = nil
    @user = User.new 
  end

  def signup
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

  def signin
    flash[:notice] = nil
    @user = User.new
  end

  def login
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_username(username).first
    if @user.blank?
      @user = User.new
      flash[:notice] = "Invalid username"
      render 'signin'
    else
      # These methods are in the helper file.
      if confirm_user(@user, password)
        login_user(@user)
        redirect_to dashboard_path
      else
        flash[:notice] = "The username and password do not match"
        render 'signin'
      end
    end
  end

  def logout
    logout_user
    redirect_to sign_in_path
  end

  def edit
      
  end

  def update
      
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
